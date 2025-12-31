--- Triplet class for parsing and handling compilation target triplet strings
-- Uses lookup table for known formats instead of complex parsing logic
-- @module Triplet
-- @author Arendelle
--- Triplet class definition
-- @table Triplet
-- @string arch Architecture type (e.g., x86_64, arm, mips)
-- @string vendor Vendor information (e.g., pc, apple, unknown)
-- @string platform Platform type (e.g., linux, windows, darwin24)
-- @string abi ABI type, optional (e.g., gnu, musl)
local Triplet = {}
Triplet.__index = Triplet -- This is crucial for method lookup
Triplet.__name__ = "Triplet"

-- Known ABI identifiers to help disambiguate 3-part triplets
local KNOWN_ABIS = {
    gnu = true,
    musl = true,
    gnueabihf = true,
    msvc = true,
    android = true
}

-- Common vendor identifiers to reject when vendor is explicitly present
-- but ABI is also present in a 3-part triplet (which should mean vendor
-- was omitted, not provided).
local KNOWN_VENDORS = {pc = true, w64 = true, apple = true, unknown = true}

local function is_valid_abi(abi)
    if KNOWN_ABIS[abi] then
        return true
    elseif abi ~= nil and string.match(abi, "^android%d+$") ~= nil then
        -- android version ABI
        return true
    else
        return false
    end
end

--- Create a new Triplet instance
-- Parse triplet string and create corresponding Triplet object using lookup table
-- @string triplet_str Triplet string in various formats
-- @treturn Triplet New Triplet instance
-- @usage local triplet = Triplet:new("x86_64-pc-linux-gnu")
function Triplet:new(triplet_str)
    local instance = {arch = nil, vendor = nil, platform = nil, abi = nil}
    setmetatable(instance, Triplet)

    -- Look up the triplet in our known patterns table
    -- Fallback parsing to support custom or vendor-less triplets
    local parts = {}
    for part in string.gmatch(triplet_str, "([^%-]+)") do
        parts[#parts + 1] = part
    end

    local pattern = nil
    if #parts == 4 then
        pattern = {
            arch = parts[1],
            vendor = parts[2],
            platform = parts[3],
            abi = parts[4]
        }
    elseif #parts == 3 then
        -- Handle common vendor/platform aliases before generic parsing
        if parts[2] == "w64" and parts[3] == "mingw32" then
            pattern = {
                arch = parts[1],
                vendor = "w64",
                platform = "windows",
                abi = "gnu"
            }
        elseif parts[2] == "apple" then
            pattern = {
                arch = parts[1],
                vendor = "apple",
                platform = parts[3],
                abi = nil
            }
            elseif is_valid_abi(parts[3]) then
            -- Only accept 3-part inputs with ABI when vendor is omitted
            if KNOWN_VENDORS[parts[2]] then
                error("Unknown triplet format: " .. triplet_str)
            end
            pattern = {
                arch = parts[1],
                vendor = "unknown",
                platform = parts[2],
                abi = parts[3]
            }
        else
                -- Treat as explicit vendor + platform without ABI
                if parts[2] == "pc" or parts[2] == "w64" then
                    error("Unknown triplet format: " .. triplet_str)
                end
            pattern = {
                arch = parts[1],
                vendor = parts[2],
                platform = parts[3],
                abi = nil
            }
        end
    elseif #parts == 2 then
        pattern = {
            arch = parts[1],
            vendor = "unknown",
            platform = parts[2],
            abi = nil
        }
    else
        error("Unknown triplet format: " .. triplet_str)
    end

    -- assume(pattern ~= nil)

    -- Copy the pattern data to instance
    instance.arch = pattern.arch
    instance.vendor = pattern.vendor
    instance.platform = pattern.platform
    instance.abi = pattern.abi

    return instance
end

--- Get architecture information
-- @treturn string Architecture type
function Triplet:get_arch() return self.arch end

--- Get vendor information
-- @treturn string Vendor information
function Triplet:get_vendor() return self.vendor end

--- Get platform information
-- @treturn string Platform type
function Triplet:get_platform() return self.platform end

--- Get ABI information
-- @treturn string ABI type, returns nil if not set
function Triplet:get_abi() return self.abi end

--- Convert Triplet object to string representation
-- @treturn string Formatted triplet string
function Triplet:to_string()
    local triplet_str = self.arch .. "-" .. self.vendor .. "-" .. self.platform
    if self.abi then triplet_str = triplet_str .. "-" .. self.abi end
    return triplet_str
end

function Triplet:to_string_without_vendor()
    local triplet_str = self.arch .. "-" .. self.platform
    if self.abi then triplet_str = triplet_str .. "-" .. self.abi end
    return triplet_str
end

-- Return the Triplet module
return Triplet

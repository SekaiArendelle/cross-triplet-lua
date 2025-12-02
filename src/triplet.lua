--- Triplet class for parsing and handling compilation target triplet strings
-- Supports formats: arch-vendor-platform or arch-vendor-platform-abi
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

--- Create a new Triplet instance
-- Parse triplet string and create corresponding Triplet object
-- @string triplet_str Triplet string in format "arch-vendor-platform" or "arch-vendor-platform-abi"
-- @treturn Triplet New Triplet instance
-- @usage local triplet = Triplet:new("x86_64-pc-linux-gnu")
function Triplet:new(triplet_str)
    local instance = {arch = nil, vendor = nil, platform = nil, abi = nil}
    setmetatable(instance, Triplet)

    -- Parse triplet string
    local parts = {}
    for part in string.gmatch(triplet_str, "([^%-]+)") do
        table.insert(parts, part)
    end

    if #parts < 3 or #parts > 4 then
        error("Invalid triplet format: " .. triplet_str)
    end

    instance.arch = parts[1]
    instance.vendor = parts[2]
    instance.platform = parts[3]
    if #parts == 4 then instance.abi = parts[4] end

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

-- Return the Triplet module
return Triplet

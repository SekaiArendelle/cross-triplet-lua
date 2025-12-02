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

-- Known triplet patterns lookup table
-- Maps input string to normalized components
local KNOWN_TRIPLETS = {
    -- Standard 4-part formats
    ["x86_64-pc-linux-gnu"] = {
        arch = "x86_64",
        vendor = "pc",
        platform = "linux",
        abi = "gnu"
    },
    ["x86_64-w64-mingw32"] = {
        arch = "x86_64",
        vendor = "w64",
        platform = "windows",
        abi = "gnu"
    },

    -- 3-part formats (missing vendor)
    ["x86_64-linux-gnu"] = {
        arch = "x86_64",
        vendor = "unknown",
        platform = "linux",
        abi = "gnu"
    },
    ["x86_64-linux-musl"] = {
        arch = "x86_64",
        vendor = "unknown",
        platform = "linux",
        abi = "musl"
    },
    ["arm-linux-gnueabihf"] = {
        arch = "arm",
        vendor = "unknown",
        platform = "linux",
        abi = "gnueabihf"
    },
    ["aarch64-linux-gnu"] = {
        arch = "aarch64",
        vendor = "unknown",
        platform = "linux",
        abi = "gnu"
    },
    ["i686-linux-gnu"] = {
        arch = "i686",
        vendor = "unknown",
        platform = "linux",
        abi = "gnu"
    },

    -- 3-part formats (missing abi)
    ["x86_64-apple-darwin"] = {
        arch = "x86_64",
        vendor = "apple",
        platform = "darwin",
        abi = nil
    },
    ["arm-apple-darwin"] = {
        arch = "arm",
        vendor = "apple",
        platform = "darwin",
        abi = nil
    },

    -- Other common formats
    ["i686-w64-mingw32"] = {
        arch = "i686",
        vendor = "w64",
        platform = "windows",
        abi = "gnu"
    },
    ["x86_64-apple-darwin24"] = {
        arch = "x86_64",
        vendor = "apple",
        platform = "darwin24",
        abi = nil
    },
    ["armv7-linux-gnueabihf"] = {
        arch = "armv7",
        vendor = "unknown",
        platform = "linux",
        abi = "gnueabihf"
    }
}

--- Create a new Triplet instance
-- Parse triplet string and create corresponding Triplet object using lookup table
-- @string triplet_str Triplet string in various formats
-- @treturn Triplet New Triplet instance
-- @usage local triplet = Triplet:new("x86_64-pc-linux-gnu")
function Triplet:new(triplet_str)
    local instance = {arch = nil, vendor = nil, platform = nil, abi = nil}
    setmetatable(instance, Triplet)

    -- Look up the triplet in our known patterns table
    local pattern = KNOWN_TRIPLETS[triplet_str]
    if not pattern then error("Unknown triplet format: " .. triplet_str) end

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

-- Return the Triplet module
return Triplet

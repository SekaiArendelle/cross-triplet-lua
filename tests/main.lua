package.path = package.path .. ";./src/?.lua;./?.lua;../src/?.lua"
local Triplet = require("triplet")

local function test_x86_64_pc_linux_gnu_1()
    local triplet = Triplet:new("x86_64-pc-linux-gnu")
    assert(triplet:get_arch() == "x86_64", "Arch should be x86_64")
    assert(triplet:get_vendor() == "pc", "Vendor should be pc")
    assert(triplet:get_platform() == "linux", "Platform should be linux")
    assert(triplet:get_abi() == "gnu", "ABI should be gnu")
    assert(triplet:to_string() == "x86_64-pc-linux-gnu", "Triplet string should be x86_64-pc-linux-gnu")
end

--- Main demonstration function
local function main()
    test_x86_64_pc_linux_gnu_1()
end

-- Run the demonstration
main()

package.path = package.path .. ";./src/?.lua;./?.lua;../src/?.lua"
local Triplet = require("triplet")

local function test_x86_64_pc_linux_gnu_1()
    local triplet = Triplet:new("x86_64-pc-linux-gnu")
    assert(triplet:get_arch() == "x86_64", "Arch should be x86_64")
    assert(triplet:get_vendor() == "pc", "Vendor should be pc")
    assert(triplet:get_platform() == "linux", "Platform should be linux")
    assert(triplet:get_abi() == "gnu", "ABI should be gnu")
    assert(triplet:to_string() == "x86_64-pc-linux-gnu",
           "Triplet string should be x86_64-pc-linux-gnu")
end

local function test_x86_64_pc_linux_gnu_2()
    local triplet = Triplet:new("x86_64-linux-gnu")
    assert(triplet:get_arch() == "x86_64", "Arch should be x86_64")
    assert(triplet:get_vendor() == "unknown", "Vendor should be unknown")
    assert(triplet:get_platform() == "linux", "Platform should be linux")
    assert(triplet:get_abi() == "gnu", "ABI should be gnu")
    assert(triplet:to_string() == "x86_64-unknown-linux-gnu",
           "Triplet string should be x86_64-unknown-linux-gnu")
end

local function test_invalid_triplet_1()
    local has_value, value =
        pcall(function() Triplet:new("x86_64-pc-linux") end)
    assert(has_value == false, "Should throw error")
end

local function test_x86_64_windows_gnu_1()
    local triplet = Triplet:new("x86_64-w64-mingw32")
    assert(triplet:get_arch() == "x86_64", "Arch should be x86_64")
    assert(triplet:get_vendor() == "w64", "Vendor should be w64")
    assert(triplet:get_platform() == "windows", "Platform should be windows")
    assert(triplet:get_abi() == "gnu", "ABI should be gnu")
    assert(triplet:to_string() == "x86_64-w64-windows-gnu",
           "Triplet string should be x86_64-w64-windows-gnu")
end

local function test_x86_64_windows_gnu_2()
    local triplet = Triplet:new("x86_64-windows-gnu")
    assert(triplet:get_arch() == "x86_64", "Arch should be x86_64")
    assert(triplet:get_vendor() == "unknown", "Vendor should be unknown")
    assert(triplet:get_platform() == "windows", "Platform should be windows")
    assert(triplet:get_abi() == "gnu", "ABI should be gnu")
    assert(triplet:to_string() == "x86_64-unknown-windows-gnu",
           "Triplet string should be x86_64-w64-windows-gnu")
end

local function test_aarch64_apple_darwin24()
    local triplet = Triplet:new("aarch64-apple-darwin24")
    assert(triplet:get_arch() == "aarch64", "Arch should be aarch64")
    assert(triplet:get_vendor() == "apple", "Vendor should be apple")
    assert(triplet:get_platform() == "darwin24", "Platform should be darwin24")
    assert(triplet:get_abi() == nil, "ABI should be nil")
    assert(triplet:to_string() == "aarch64-apple-darwin24",
           "Triplet string should be aarch64-apple-darwin24")
end

--- Main demonstration function
local function main()
    test_x86_64_pc_linux_gnu_1()
    test_x86_64_pc_linux_gnu_2()
    test_invalid_triplet_1()
    test_x86_64_windows_gnu_1()
    test_x86_64_windows_gnu_2()
    test_aarch64_apple_darwin24()
end

-- Run the demonstration
main()

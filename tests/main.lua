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

local function test_x86_64_xxx_linux_gnu()
    local triplet = Triplet:new("x86_64-xxx-linux-gnu")
    assert(triplet:get_arch() == "x86_64", "Arch should be x86_64")
    assert(triplet:get_vendor() == "xxx", "Vendor should be xxx")
    assert(triplet:get_platform() == "linux", "Platform should be linux")
    assert(triplet:get_abi() == "gnu", "ABI should be gnu")
    assert(triplet:to_string() == "x86_64-xxx-linux-gnu",
           "Triplet string should be x86_64-xxx-linux-gnu")
end

local function test_x86_64_ubuntu2004_linux_gnu()
    local triplet = Triplet:new("x86_64-ubuntu2004-linux-gnu")
    assert(triplet:get_arch() == "x86_64", "Arch should be x86_64")
    assert(triplet:get_vendor() == "ubuntu2004", "Vendor should be ubuntu2004")
    assert(triplet:get_platform() == "linux", "Platform should be linux")
    assert(triplet:get_abi() == "gnu", "ABI should be gnu")
    assert(triplet:to_string() == "x86_64-ubuntu2004-linux-gnu",
           "Triplet string should be x86_64-ubuntu2004-linux-gnu")
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

local function test_aarch64_darwin24()
    local triplet = Triplet:new("aarch64-darwin24")
    assert(triplet:get_arch() == "aarch64", "Arch should be aarch64")
    assert(triplet:get_vendor() == "unknown", "Vendor should be unknown")
    assert(triplet:get_platform() == "darwin24", "Platform should be darwin24")
    assert(triplet:get_abi() == nil, "ABI should be nil")
    assert(triplet:to_string() == "aarch64-unknown-darwin24",
           "Triplet string should be aarch64-unknown-darwin24")
end

local function test_aarch64_apple_darwin()
    local triplet = Triplet:new("aarch64-apple-darwin")
    assert(triplet:get_arch() == "aarch64", "Arch should be aarch64")
    assert(triplet:get_vendor() == "apple", "Vendor should be apple")
    assert(triplet:get_platform() == "darwin", "Platform should be darwin")
    assert(triplet:get_abi() == nil, "ABI should be nil")
    assert(triplet:to_string() == "aarch64-apple-darwin",
           "Triplet string should be aarch64-apple-darwin")
end

local function test_aarch64_darwin()
    local triplet = Triplet:new("aarch64-darwin")
    assert(triplet:get_arch() == "aarch64", "Arch should be aarch64")
    assert(triplet:get_vendor() == "unknown", "Vendor should be unknown")
    assert(triplet:get_platform() == "darwin", "Platform should be darwin")
    assert(triplet:get_abi() == nil, "ABI should be nil")
    assert(triplet:to_string() == "aarch64-unknown-darwin",
           "Triplet string should be aarch64-unknown-darwin")
end

local function test_aarch64_unknown_darwin()
    local triplet = Triplet:new("aarch64-unknown-darwin")
    assert(triplet:get_arch() == "aarch64", "Arch should be aarch64")
    assert(triplet:get_vendor() == "unknown", "Vendor should be unknown")
    assert(triplet:get_platform() == "darwin", "Platform should be darwin")
    assert(triplet:get_abi() == nil, "ABI should be nil")
    assert(triplet:to_string() == "aarch64-unknown-darwin",
           "Triplet string should be aarch64-unknown-darwin")
end

local function test_aarch64_unknown_darwin24()
    local triplet = Triplet:new("aarch64-unknown-darwin24")
    assert(triplet:get_arch() == "aarch64", "Arch should be aarch64")
    assert(triplet:get_vendor() == "unknown", "Vendor should be unknown")
    assert(triplet:get_platform() == "darwin24", "Platform should be darwin24")
    assert(triplet:get_abi() == nil, "ABI should be nil")
    assert(triplet:to_string() == "aarch64-unknown-darwin24",
           "Triplet string should be aarch64-unknown-darwin24")
end

local function test_invalid_triplet_2()
    local has_value, value = pcall(function() Triplet:new("x86_64-pc-gnu") end)
    assert(has_value == false, "Should throw error")
end

local function test_aarch64_linux_android()
    local triplet = Triplet:new("aarch64-linux-android")
    assert(triplet:get_arch() == "aarch64", "Arch should be aarch64")
    assert(triplet:get_vendor() == "unknown", "Vendor should be unknown")
    assert(triplet:get_platform() == "linux", "Platform should be linux")
    assert(triplet:get_abi() == "android", "ABI should be android")
    assert(triplet:to_string() == "aarch64-unknown-linux-android",
           "Triplet string should be aarch64-unknown-linux-android")
end

local function test_aarch64_linux_android24()
    local triplet = Triplet:new("aarch64-linux-android24")
    assert(triplet:get_arch() == "aarch64", "Arch should be aarch64")
    assert(triplet:get_vendor() == "unknown", "Vendor should be unknown")
    assert(triplet:get_platform() == "linux", "Platform should be linux")
    assert(triplet:get_abi() == "android24", "ABI should be android24")
    assert(triplet:to_string() == "aarch64-unknown-linux-android24",
           "Triplet string should be aarch64-unknown-linux-android24")
end

local function test_aarch64_linux_android30()
    local triplet = Triplet:new("aarch64-linux-android30")
    assert(triplet:get_arch() == "aarch64", "Arch should be aarch64")
    assert(triplet:get_vendor() == "unknown", "Vendor should be unknown")
    assert(triplet:get_platform() == "linux", "Platform should be linux")
    assert(triplet:get_abi() == "android30", "ABI should be android30")
    assert(triplet:to_string() == "aarch64-unknown-linux-android30",
           "Triplet string should be aarch64-unknown-linux-android30")
end

local function test_x86_64_linux_android30()
    local triplet = Triplet:new("x86_64-linux-android30")
    assert(triplet:get_arch() == "x86_64", "Arch should be x86_64")
    assert(triplet:get_vendor() == "unknown", "Vendor should be unknown")
    assert(triplet:get_platform() == "linux", "Platform should be linux")
    assert(triplet:get_abi() == "android30", "ABI should be android30")
    assert(triplet:to_string() == "x86_64-unknown-linux-android30",
           "Triplet string should be x86_64-unknown-linux-android30")
end

local function test_x86_64_linux_android()
    local triplet = Triplet:new("x86_64-linux-android")
    assert(triplet:get_arch() == "x86_64", "Arch should be x86_64")
    assert(triplet:get_vendor() == "unknown", "Vendor should be unknown")
    assert(triplet:get_platform() == "linux", "Platform should be linux")
    assert(triplet:get_abi() == "android", "ABI should be android")
    assert(triplet:to_string() == "x86_64-unknown-linux-android",
           "Triplet string should be x86_64-unknown-linux-android")
end

local function test_loongarch64_linux_gnu()
    local triplet = Triplet:new("loongarch64-linux-gnu")
    assert(triplet:get_arch() == "loongarch64", "Arch should be loongarch64")
    assert(triplet:get_vendor() == "unknown", "Vendor should be unknown")
    assert(triplet:get_platform() == "linux", "Platform should be linux")
    assert(triplet:get_abi() == "gnu", "ABI should be gnu")
    assert(triplet:to_string() == "loongarch64-unknown-linux-gnu",
           "Triplet string should be loongarch64-unknown-linux-gnu")
end

local function test_invalid_triplet_3()
    local has_value, value = pcall(function() Triplet:new("xxx-linux-gnu") end)
    assert(has_value == false, "Should throw error")
end

--- Main demonstration function
local function main()
    test_x86_64_pc_linux_gnu_1()
    test_x86_64_pc_linux_gnu_2()
    test_x86_64_xxx_linux_gnu()
    test_x86_64_ubuntu2004_linux_gnu()
    test_invalid_triplet_1()
    test_x86_64_windows_gnu_1()
    test_x86_64_windows_gnu_2()
    test_aarch64_apple_darwin24()
    test_aarch64_darwin24()
    test_aarch64_apple_darwin()
    test_aarch64_darwin()
    test_aarch64_unknown_darwin()
    test_aarch64_unknown_darwin24()
    test_invalid_triplet_2()
    test_aarch64_linux_android()
    test_aarch64_linux_android24()
    test_aarch64_linux_android30()
    test_x86_64_linux_android30()
    test_x86_64_linux_android()
    test_loongarch64_linux_gnu()
    test_invalid_triplet_3()
end

-- Run the demonstration
main()

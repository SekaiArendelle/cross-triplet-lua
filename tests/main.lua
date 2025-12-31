package.path = package.path .. ";./src/?.lua;./?.lua;../src/?.lua"
local Triplet = require("triplet")

local function assert_arch(triplet, expected)
    assert(triplet:get_arch() == expected, "Arch should be " .. tostring(expected))
end

local function assert_vendor(triplet, expected)
    assert(triplet:get_vendor() == expected,
           "Vendor should be " .. tostring(expected))
end

local function assert_platform(triplet, expected)
    assert(triplet:get_platform() == expected,
           "Platform should be " .. tostring(expected))
end

local function assert_abi(triplet, expected)
    assert(triplet:get_abi() == expected, "ABI should be " .. tostring(expected))
end

local function assert_to_string(triplet, expected)
    assert(triplet:to_string() == expected,
           "Triplet string should be " .. tostring(expected))
end

local function assert_to_string_without_vendor(triplet, expected)
    assert(triplet:to_string_without_vendor() == expected,
           "to_string_without_vendor should be " .. expected)
end

local function test_x86_64_pc_linux_gnu()
    local triplet = Triplet:new("x86_64-pc-linux-gnu")
    assert_arch(triplet, "x86_64")
    assert_vendor(triplet, "pc")
    assert_platform(triplet, "linux")
    assert_abi(triplet, "gnu")
    assert_to_string(triplet, "x86_64-pc-linux-gnu")
    assert_to_string_without_vendor(triplet, "x86_64-linux-gnu")
end

local function test_x86_64_linux_gnu()
    local triplet = Triplet:new("x86_64-linux-gnu")
    assert_arch(triplet, "x86_64")
    assert_vendor(triplet, "unknown")
    assert_platform(triplet, "linux")
    assert_abi(triplet, "gnu")
    assert_to_string(triplet, "x86_64-unknown-linux-gnu")
    assert_to_string_without_vendor(triplet, "x86_64-linux-gnu")
end

local function test_x86_64_xxx_linux_gnu()
    local triplet = Triplet:new("x86_64-xxx-linux-gnu")
    assert_arch(triplet, "x86_64")
    assert_vendor(triplet, "xxx")
    assert_platform(triplet, "linux")
    assert_abi(triplet, "gnu")
    assert_to_string(triplet, "x86_64-xxx-linux-gnu")
    assert_to_string_without_vendor(triplet, "x86_64-linux-gnu")
end

local function test_x86_64_ubuntu2004_linux_gnu()
    local triplet = Triplet:new("x86_64-ubuntu2004-linux-gnu")
    assert_arch(triplet, "x86_64")
    assert_vendor(triplet, "ubuntu2004")
    assert_platform(triplet, "linux")
    assert_abi(triplet, "gnu")
    assert_to_string(triplet, "x86_64-ubuntu2004-linux-gnu")
    assert_to_string_without_vendor(triplet, "x86_64-linux-gnu")
end

local function test_invalid_triplet_1()
    local has_value, value =
        pcall(function() Triplet:new("x86_64-pc-linux") end)
    assert(has_value == false, "Should throw error")
end

local function test_x86_64_w64_mingw32()
    local triplet = Triplet:new("x86_64-w64-mingw32")
    assert_arch(triplet, "x86_64")
    assert_vendor(triplet, "w64")
    assert_platform(triplet, "windows")
    assert_abi(triplet, "gnu")
    assert_to_string(triplet, "x86_64-w64-windows-gnu")
    assert_to_string_without_vendor(triplet, "x86_64-windows-gnu")
end

local function test_x86_64_windows_gnu()
    local triplet = Triplet:new("x86_64-windows-gnu")
    assert_arch(triplet, "x86_64")
    assert_vendor(triplet, "unknown")
    assert_platform(triplet, "windows")
    assert_abi(triplet, "gnu")
    assert_to_string(triplet, "x86_64-unknown-windows-gnu")
    assert_to_string_without_vendor(triplet, "x86_64-windows-gnu")
end

local function test_aarch64_apple_darwin24()
    local triplet = Triplet:new("aarch64-apple-darwin24")
    assert_arch(triplet, "aarch64")
    assert_vendor(triplet, "apple")
    assert_platform(triplet, "darwin24")
    assert_abi(triplet, nil)
    assert_to_string(triplet, "aarch64-apple-darwin24")
    assert_to_string_without_vendor(triplet, "aarch64-darwin24")
end

local function test_aarch64_darwin24()
    local triplet = Triplet:new("aarch64-darwin24")
    assert_arch(triplet, "aarch64")
    assert_vendor(triplet, "unknown")
    assert_platform(triplet, "darwin24")
    assert_abi(triplet, nil)
    assert_to_string(triplet, "aarch64-unknown-darwin24")
    assert_to_string_without_vendor(triplet, "aarch64-darwin24")
end

local function test_aarch64_apple_darwin()
    local triplet = Triplet:new("aarch64-apple-darwin")
    assert_arch(triplet, "aarch64")
    assert_vendor(triplet, "apple")
    assert_platform(triplet, "darwin")
    assert_abi(triplet, nil)
    assert_to_string(triplet, "aarch64-apple-darwin")
    assert_to_string_without_vendor(triplet, "aarch64-darwin")
end

local function test_aarch64_darwin()
    local triplet = Triplet:new("aarch64-darwin")
    assert_arch(triplet, "aarch64")
    assert_vendor(triplet, "unknown")
    assert_platform(triplet, "darwin")
    assert_abi(triplet, nil)
    assert_to_string(triplet, "aarch64-unknown-darwin")
    assert_to_string_without_vendor(triplet, "aarch64-darwin")
end

local function test_aarch64_unknown_darwin()
    local triplet = Triplet:new("aarch64-unknown-darwin")
    assert_arch(triplet, "aarch64")
    assert_vendor(triplet, "unknown")
    assert_platform(triplet, "darwin")
    assert_abi(triplet, nil)
    assert_to_string(triplet, "aarch64-unknown-darwin")
    assert_to_string_without_vendor(triplet, "aarch64-darwin")
end

local function test_aarch64_unknown_darwin24()
    local triplet = Triplet:new("aarch64-unknown-darwin24")
    assert_arch(triplet, "aarch64")
    assert_vendor(triplet, "unknown")
    assert_platform(triplet, "darwin24")
    assert_abi(triplet, nil)
    assert_to_string(triplet, "aarch64-unknown-darwin24")
    assert_to_string_without_vendor(triplet, "aarch64-darwin24")
end

local function test_invalid_triplet_2()
    local has_value, value = pcall(function() Triplet:new("x86_64-pc-gnu") end)
    assert(has_value == false, "Should throw error")
end

local function test_aarch64_linux_android()
    local triplet = Triplet:new("aarch64-linux-android")
    assert_arch(triplet, "aarch64")
    assert_vendor(triplet, "unknown")
    assert_platform(triplet, "linux")
    assert_abi(triplet, "android")
    assert_to_string(triplet, "aarch64-unknown-linux-android")
    assert_to_string_without_vendor(triplet, "aarch64-linux-android")
end

local function test_aarch64_linux_android24()
    local triplet = Triplet:new("aarch64-linux-android24")
    assert_arch(triplet, "aarch64")
    assert_vendor(triplet, "unknown")
    assert_platform(triplet, "linux")
    assert_abi(triplet, "android24")
    assert_to_string(triplet, "aarch64-unknown-linux-android24")
    assert_to_string_without_vendor(triplet, "aarch64-linux-android24")
end

local function test_aarch64_linux_android30()
    local triplet = Triplet:new("aarch64-linux-android30")
    assert_arch(triplet, "aarch64")
    assert_vendor(triplet, "unknown")
    assert_platform(triplet, "linux")
    assert_abi(triplet, "android30")
    assert_to_string(triplet, "aarch64-unknown-linux-android30")
    assert_to_string_without_vendor(triplet, "aarch64-linux-android30")
end

local function test_x86_64_linux_android30()
    local triplet = Triplet:new("x86_64-linux-android30")
    assert_arch(triplet, "x86_64")
    assert_vendor(triplet, "unknown")
    assert_platform(triplet, "linux")
    assert_abi(triplet, "android30")
    assert_to_string(triplet, "x86_64-unknown-linux-android30")
    assert_to_string_without_vendor(triplet, "x86_64-linux-android30")
end

local function test_x86_64_linux_android()
    local triplet = Triplet:new("x86_64-linux-android")
    assert_arch(triplet, "x86_64")
    assert_vendor(triplet, "unknown")
    assert_platform(triplet, "linux")
    assert_abi(triplet, "android")
    assert_to_string(triplet, "x86_64-unknown-linux-android")
    assert_to_string_without_vendor(triplet, "x86_64-linux-android")
end

local function test_loongarch64_linux_gnu()
    local triplet = Triplet:new("loongarch64-linux-gnu")
    assert_arch(triplet, "loongarch64")
    assert_vendor(triplet, "unknown")
    assert_platform(triplet, "linux")
    assert_abi(triplet, "gnu")
    assert_to_string(triplet, "loongarch64-unknown-linux-gnu")
    assert_to_string_without_vendor(triplet, "loongarch64-linux-gnu")
end

-- versions earlier than i686 is handled as i686
local function test_i386_linux_gnu()
    local triplet = Triplet:new("i386-linux-gnu")
    assert_arch(triplet, "i686")
    assert_vendor(triplet, "unknown")
    assert_platform(triplet, "linux")
    assert_abi(triplet, "gnu")
    assert_to_string(triplet, "i686-unknown-linux-gnu")
    assert_to_string_without_vendor(triplet, "i686-linux-gnu")
end

local function test_i486_linux_gnu()
    local triplet = Triplet:new("i486-linux-gnu")
    assert_arch(triplet, "i686")
    assert_vendor(triplet, "unknown")
    assert_platform(triplet, "linux")
    assert_abi(triplet, "gnu")
    assert_to_string(triplet, "i686-unknown-linux-gnu")
    assert_to_string_without_vendor(triplet, "i686-linux-gnu")
end

local function test_i586_linux_gnu()
    local triplet = Triplet:new("i586-linux-gnu")
    assert_arch(triplet, "i686")
    assert_vendor(triplet, "unknown")
    assert_platform(triplet, "linux")
    assert_abi(triplet, "gnu")
    assert_to_string(triplet, "i686-unknown-linux-gnu")
    assert_to_string_without_vendor(triplet, "i686-linux-gnu")
end

local function test_i686_linux_gnu()
    local triplet = Triplet:new("i686-linux-gnu")
    assert_arch(triplet, "i686")
    assert_vendor(triplet, "unknown")
    assert_platform(triplet, "linux")
    assert_abi(triplet, "gnu")
    assert_to_string(triplet, "i686-unknown-linux-gnu")
    assert_to_string_without_vendor(triplet, "i686-linux-gnu")
end

local function test_invalid_triplet_3()
    local has_value, value = pcall(function() Triplet:new("xxx-linux-gnu") end)
    assert(has_value == false, "Should throw error")
end

local function test_x86_64_pc_windows_msvc()
    local triplet = Triplet:new("x86_64-pc-windows-msvc")
    assert_arch(triplet, "x86_64")
    assert_vendor(triplet, "pc")
    assert_platform(triplet, "windows")
    assert_abi(triplet, "msvc")
    assert_to_string(triplet, "x86_64-pc-windows-msvc")
    assert_to_string_without_vendor(triplet, "x86_64-windows-msvc")
end

local function test_x86_64_windows_msvc()
    local triplet = Triplet:new("x86_64-windows-msvc")
    assert_arch(triplet, "x86_64")
    assert_vendor(triplet, "unknown")
    assert_platform(triplet, "windows")
    assert_abi(triplet, "msvc")
    assert_to_string(triplet, "x86_64-unknown-windows-msvc")
    assert_to_string_without_vendor(triplet, "x86_64-windows-msvc")
end

local function test_i686_pc_windows_msvc()
    local triplet = Triplet:new("i686-pc-windows-msvc")
    assert_arch(triplet, "i686")
    assert_vendor(triplet, "pc")
    assert_platform(triplet, "windows")
    assert_abi(triplet, "msvc")
    assert_to_string(triplet, "i686-pc-windows-msvc")
    assert_to_string_without_vendor(triplet, "i686-windows-msvc")
end

local function test_i686_windows_msvc()
    local triplet = Triplet:new("i686-windows-msvc")
    assert_arch(triplet, "i686")
    assert_vendor(triplet, "unknown")
    assert_platform(triplet, "windows")
    assert_abi(triplet, "msvc")
    assert_to_string(triplet, "i686-unknown-windows-msvc")
    assert_to_string_without_vendor(triplet, "i686-windows-msvc")
end

local function test_aarch64_pc_windows_msvc()
    local triplet = Triplet:new("aarch64-pc-windows-msvc")
    assert_arch(triplet, "aarch64")
    assert_vendor(triplet, "pc")
    assert_platform(triplet, "windows")
    assert_abi(triplet, "msvc")
    assert_to_string(triplet, "aarch64-pc-windows-msvc")
    assert_to_string_without_vendor(triplet, "aarch64-windows-msvc")
end

local function test_aarch64_windows_msvc()
    local triplet = Triplet:new("aarch64-windows-msvc")
    assert_arch(triplet, "aarch64")
    assert_vendor(triplet, "unknown")
    assert_platform(triplet, "windows")
    assert_abi(triplet, "msvc")
    assert_to_string(triplet, "aarch64-unknown-windows-msvc")
    assert_to_string_without_vendor(triplet, "aarch64-windows-msvc")
end

local function test_x86_64_linux_musl()
    local triplet = Triplet:new("x86_64-linux-musl")
    assert_arch(triplet, "x86_64")
    assert_vendor(triplet, "unknown")
    assert_platform(triplet, "linux")
    assert_abi(triplet, "musl")
    assert_to_string(triplet, "x86_64-unknown-linux-musl")
    assert_to_string_without_vendor(triplet, "x86_64-linux-musl")
end

local function test_arm_linux_gnueabi()
    local triplet = Triplet:new("arm-linux-gnueabi")
    assert_arch(triplet, "arm")
    assert_vendor(triplet, "unknown")
    assert_platform(triplet, "linux")
    assert_abi(triplet, "gnueabi")
    assert_to_string(triplet, "arm-unknown-linux-gnueabi")
    assert_to_string_without_vendor(triplet, "arm-linux-gnueabi")
end

local function test_arm_linux_gnueabihf()
    local triplet = Triplet:new("arm-linux-gnueabihf")
    assert_arch(triplet, "arm")
    assert_vendor(triplet, "unknown")
    assert_platform(triplet, "linux")
    assert_abi(triplet, "gnueabihf")
    assert_to_string(triplet, "arm-unknown-linux-gnueabihf")
    assert_to_string_without_vendor(triplet, "arm-linux-gnueabihf")
end

local function test_wasm32_wasip1()
    local triplet = Triplet:new("wasm32-wasip1")
    assert_arch(triplet, "wasm32")
    assert_vendor(triplet, "unknown")
    assert_platform(triplet, "wasip1")
    assert_abi(triplet, nil)
    assert_to_string(triplet, "wasm32-unknown-wasip1")
    assert_to_string_without_vendor(triplet, "wasm32-wasip1")
end

local function test_wasm32_unknown_wasip1()
    local triplet = Triplet:new("wasm32-unknown-wasip1")
    assert_arch(triplet, "wasm32")
    assert_vendor(triplet, "unknown")
    assert_platform(triplet, "wasip1")
    assert_abi(triplet, nil)
    assert_to_string(triplet, "wasm32-unknown-wasip1")
    assert_to_string_without_vendor(triplet, "wasm32-wasip1")
end

local function test_wasm32_emscripten()
    local triplet = Triplet:new("wasm32-emscripten")
    assert_arch(triplet, "wasm32")
    assert_vendor(triplet, "unknown")
    assert_platform(triplet, "emscripten")
    assert_abi(triplet, nil)
    assert_to_string(triplet, "wasm32-unknown-emscripten")
    assert_to_string_without_vendor(triplet, "wasm32-emscripten")
end

local function test_wasm32_unknown_emscripten()
    local triplet = Triplet:new("wasm32-unknown-emscripten")
    assert_arch(triplet, "wasm32")
    assert_vendor(triplet, "unknown")
    assert_platform(triplet, "emscripten")
    assert_abi(triplet, nil)
    assert_to_string(triplet, "wasm32-unknown-emscripten")
    assert_to_string_without_vendor(triplet, "wasm32-emscripten")
end

--- Main demonstration function
local function main()
    test_x86_64_pc_linux_gnu()
    test_x86_64_linux_gnu()
    test_x86_64_xxx_linux_gnu()
    test_x86_64_ubuntu2004_linux_gnu()
    test_invalid_triplet_1()
    test_x86_64_w64_mingw32()
    test_x86_64_windows_gnu()
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
    test_i386_linux_gnu()
    test_i486_linux_gnu()
    test_i586_linux_gnu()
    test_i686_linux_gnu()
    test_invalid_triplet_3()
    test_x86_64_pc_windows_msvc()
    test_x86_64_windows_msvc()
    test_i686_pc_windows_msvc()
    test_i686_windows_msvc()
    test_aarch64_pc_windows_msvc()
    test_aarch64_windows_msvc()
    test_x86_64_linux_musl()
    test_arm_linux_gnueabi()
    test_arm_linux_gnueabihf()
    test_wasm32_wasip1()
    test_wasm32_unknown_wasip1()
    test_wasm32_emscripten()
    test_wasm32_unknown_emscripten()
end

-- Run the demonstration
main()

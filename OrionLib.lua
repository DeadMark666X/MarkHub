-- OrionLib UI Library (clean, no sponsor, compatible with MarkHub)
-- Credit: JensonHirst (GitHub), Modified for Clean Use

local OrionLib = {}
OrionLib.__index = OrionLib

-- Load external Orion UI library core
local success, lib = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/jensonhirst/Orion/main/Orion/Source.lua"))()
end)

if success then
    return lib
else
    warn("[OrionLib] Failed to load library:", lib)
    return nil
end

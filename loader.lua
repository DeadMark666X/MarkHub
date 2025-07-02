-- loader.lua
if not game:IsLoaded() then game.Loaded:Wait() end
repeat task.wait() until game.Players.LocalPlayer

-- Ganti URL GitHub raw-mu
local repo = "https://raw.githubusercontent.com/DeadMark666X/MarkHub/main/Modules/ui.lua"

local success, result = pcall(function()
    return loadstring(game:HttpGet(repo))()
end)

if success then
    print("[Mark/Hub] UI Loaded successfully.")
else
    warn("[Mark/Hub] Failed to load UI:", result)
end

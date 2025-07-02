local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

local PlayerName = game.Players.LocalPlayer.Name

local Window = OrionLib:MakeWindow({
    Name = "🔥 MarkHub - Emergency Hamburg",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "MarkHub"
})

-- Tambahkan Tab Utama
local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://7733658504", -- icon default
    PremiumOnly = false
})

-- Toggle Aimbot
MainTab:AddToggle({
    Name = "🔫 Aimbot",
    Default = false,
    Save = true,
    Flag = "AimbotToggle",
    Callback = function(Value)
        _G.AimbotEnabled = Value
        if Value then
            print("Aimbot Aktif")
        else
            print("Aimbot Nonaktif")
        end
    end
})

-- Toggle ESP
MainTab:AddToggle({
    Name = "🧠 ESP",
    Default = false,
    Save = true,
    Flag = "ESPToggle",
    Callback = function(Value)
        _G.ESPEnabled = Value
        if Value then
            print("ESP Aktif")
        else
            print("ESP Nonaktif")
        end
    end
})

-- Footer (nama karakter)
MainTab:AddParagraph("👤 Roblox User", PlayerName)

-- Notifikasi
OrionLib:MakeNotification({
    Name = "MarkHub",
    Content = "Script Loaded! RightControl untuk buka/tutup UI.",
    Image = "rbxassetid://7733658504",
    Time = 5
})

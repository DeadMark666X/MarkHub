local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")

-- Orion UI Lib
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

-- Key System
local CorrectKey = "MARK123" -- GANTI KEY DISINI
local hasKey = false

OrionLib:MakeNotification({
    Name = "MarkHub",
    Content = "Press RightCtrl to toggle UI",
    Image = "rbxassetid://4483345998",
    Time = 5
})

OrionLib:MakeNotification({
    Name = "Key System",
    Content = "Please enter key to access MarkHub",
    Image = "rbxassetid://4483345998",
    Time = 5
})

-- Prompt key input
OrionLib:Init()

local function promptKey()
    OrionLib:MakeWindow({
        Name = "MarkHub Key System",
        HidePremium = false,
        SaveConfig = false,
        IntroEnabled = false,
        ConfigFolder = "MarkHubKey"
    })

    OrionLib:MakeNotification({
        Name = "Input Key",
        Content = "Use key: MARK123",
        Time = 5
    })
end

promptKey()

-- UI setelah key benar
local function loadHub()
    local Window = OrionLib:MakeWindow({
        Name = "MarkHub - Emergency Hamburg",
        HidePremium = false,
        SaveConfig = false,
        IntroEnabled = true,
        IntroText = "MarkHub by DeadMark666X",
        ConfigFolder = "MarkHub"
    })

    local CombatTab = Window:MakeTab({
        Name = "Combat",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    local VisualTab = Window:MakeTab({
        Name = "Visual",
        Icon = "rbxassetid://6031075938", -- eye icon
        PremiumOnly = false
    })

    -- Aimbot
    CombatTab:AddToggle({
        Name = "Auto Aimbot (Hold Left Click)",
        Default = false,
        Callback = function(Value)
            _G.AimbotEnabled = Value
        end
    })

    -- ESP
    VisualTab:AddToggle({
        Name = "ESP (Show Players)",
        Default = false,
        Callback = function(Value)
            _G.ESPEnabled = Value
        end
    })

    -- Jalankan fungsi aimbot
    loadstring(game:HttpGet("https://raw.githubusercontent.com/DeadMark666X/MarkHub/main/autoaim.lua"))()

    -- Jalankan ESP
    loadstring(game:HttpGet("https://raw.githubusercontent.com/DeadMark666X/MarkHub/main/esp.lua"))()
end

-- Key Box UI (manual input)
OrionLib:MakeTab({
    Name = "🔐 Key Input",
    Icon = "rbxassetid://6031280882",
    PremiumOnly = false
}):AddTextbox({
    Name = "Enter Key",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        if value == CorrectKey then
            OrionLib:MakeNotification({
                Name = "Access Granted",
                Content = "Welcome to MarkHub!",
                Time = 3
            })
            wait(1)
            loadHub()
        else
            OrionLib:MakeNotification({
                Name = "Wrong Key",
                Content = "Please try again.",
                Time = 3
            })
        end
    end
})

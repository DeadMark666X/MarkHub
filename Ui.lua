-- Ui.lua
local Ui = {}

function Ui:Init()
    local ScreenGui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
    ScreenGui.Name = "MarkHubUI"

    local Frame = Instance.new("Frame", ScreenGui)
    Frame.Size = UDim2.new(0, 300, 0, 200)
    Frame.Position = UDim2.new(0.5, -150, 0.5, -100)
    Frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)

    local Label = Instance.new("TextLabel", Frame)
    Label.Text = "MARKHUB 🔥"
    Label.Size = UDim2.new(1, 0, 0, 50)
    Label.Font = Enum.Font.GothamBold
    Label.TextSize = 25
    Label.TextColor3 = Color3.new(1,1,1)
    Label.BackgroundTransparency = 1
end

return Ui

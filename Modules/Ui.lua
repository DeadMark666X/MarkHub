-- Mark/Hub UI (Emergency Hamburg)
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- UI Container
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MarkHubUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player:WaitForChild("PlayerGui")

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 400)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Title Bar
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "🚨 Mark/Hub - Emergency Hamburg"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Parent = MainFrame

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 5)
CloseBtn.Text = "X"
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextColor3 = Color3.new(1, 1, 1)
CloseBtn.TextSize = 14
CloseBtn.Parent = MainFrame

CloseBtn.MouseButton1Click:Connect(function()
	ScreenGui.Enabled = false
end)

-- Section untuk tombol dan fitur
local Section = Instance.new("Frame")
Section.Size = UDim2.new(1, -20, 1, -60)
Section.Position = UDim2.new(0, 10, 0, 50)
Section.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
Section.BorderSizePixel = 0
Section.Parent = MainFrame

local Info = Instance.new("TextLabel")
Info.Size = UDim2.new(1, -10, 0, 30)
Info.Position = UDim2.new(0, 5, 0, 5)
Info.BackgroundTransparency = 1
Info.Text = "🔥 UI Loaded Successfully - Insert Features Below"
Info.TextColor3 = Color3.new(1, 1, 1)
Info.Font = Enum.Font.SourceSansBold
Info.TextSize = 14
Info.TextWrapped = true
Info.TextXAlignment = Enum.TextXAlignment.Left
Info.Parent = Section

return true

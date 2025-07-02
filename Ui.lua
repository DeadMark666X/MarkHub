-- MarkHub UI v2 by DeadMark666X
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local CorrectKey = "MARK123"

-- UI Setup
local ScreenGui = Instance.new("ScreenGui", PlayerGui)
ScreenGui.Name = "MarkHub"
ScreenGui.ResetOnSpawn = false

-- Main Frame
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 500, 0, 320)
Main.Position = UDim2.new(0.5, -250, 0.5, -160)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Main.BackgroundTransparency = 0.2
Main.BorderSizePixel = 0
Main.Visible = false
Main.Parent = ScreenGui
Main.Active = true
Main.Draggable = true

-- Header
local Header = Instance.new("TextLabel", Main)
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
Header.Text = "MarkHub"
Header.Font = Enum.Font.GothamBlack
Header.TextColor3 = Color3.fromRGB(255, 255, 255)
Header.TextSize = 24

-- Close Button
local Close = Instance.new("TextButton", Main)
Close.Size = UDim2.new(0, 40, 0, 30)
Close.Position = UDim2.new(1, -45, 0, 5)
Close.Text = "X"
Close.Font = Enum.Font.GothamBold
Close.TextColor3 = Color3.new(1, 1, 1)
Close.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
Close.TextSize = 18
Close.MouseButton1Click:Connect(function()
	Main.Visible = false
end)

-- Sidebar Putih
local Sidebar = Instance.new("Frame", Main)
Sidebar.Size = UDim2.new(0, 120, 1, -40)
Sidebar.Position = UDim2.new(0, 0, 0, 40)
Sidebar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Sidebar.BackgroundTransparency = 0.9

-- Content Area
local Content = Instance.new("Frame", Main)
Content.Size = UDim2.new(1, -120, 1, -40)
Content.Position = UDim2.new(0, 120, 0, 40)
Content.BackgroundTransparency = 1

-- Toggle Aimbot
local AimbotToggle = Instance.new("TextButton", Content)
AimbotToggle.Size = UDim2.new(0, 150, 0, 40)
AimbotToggle.Position = UDim2.new(0, 20, 0, 20)
AimbotToggle.Text = "Aimbot: OFF"
AimbotToggle.Font = Enum.Font.Gotham
AimbotToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
AimbotToggle.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
AimbotToggle.TextSize = 18

local AimbotEnabled = false
AimbotToggle.MouseButton1Click:Connect(function()
	AimbotEnabled = not AimbotEnabled
	AimbotToggle.Text = "Aimbot: " .. (AimbotEnabled and "ON" or "OFF")
end)

-- Toggle ESP
local ESPToggle = Instance.new("TextButton", Content)
ESPToggle.Size = UDim2.new(0, 150, 0, 40)
ESPToggle.Position = UDim2.new(0, 20, 0, 80)
ESPToggle.Text = "ESP: OFF"
ESPToggle.Font = Enum.Font.Gotham
ESPToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
ESPToggle.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
ESPToggle.TextSize = 18

local ESPEnabled = false
ESPToggle.MouseButton1Click:Connect(function()
	ESPEnabled = not ESPEnabled
	ESPToggle.Text = "ESP: " .. (ESPEnabled and "ON" or "OFF")
end)

-- Key Frame (Unlock UI)
local KeyFrame = Instance.new("Frame", ScreenGui)
KeyFrame.Size = UDim2.new(0, 320, 0, 180)
KeyFrame.Position = UDim2.new(0.5, -160, 0.5, -90)
KeyFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
KeyFrame.BorderSizePixel = 0

local KeyBox = Instance.new("TextBox", KeyFrame)
KeyBox.Size = UDim2.new(0.8, 0, 0, 40)
KeyBox.Position = UDim2.new(0.1, 0, 0.2, 0)
KeyBox.PlaceholderText = "Enter Key Here"
KeyBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.TextSize = 18
KeyBox.ClearTextOnFocus = false
KeyBox.Font = Enum.Font.Gotham

local Submit = Instance.new("TextButton", KeyFrame)
Submit.Size = UDim2.new(0.8, 0, 0, 40)
Submit.Position = UDim2.new(0.1, 0, 0.6, 0)
Submit.Text = "Unlock Hub"
Submit.Font = Enum.Font.GothamBold
Submit.TextColor3 = Color3.fromRGB(255, 255, 255)
Submit.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
Submit.TextSize = 18

Submit.MouseButton1Click:Connect(function()
	if KeyBox.Text == CorrectKey then
		KeyFrame.Visible = false
		Main.Visible = true
	else
		KeyBox.Text = "Wrong Key!"
	end
end)

-- Buka Tutup pakai RightControl
UserInputService.InputBegan:Connect(function(input, processed)
	if not processed and input.KeyCode == Enum.KeyCode.RightControl then
		Main.Visible = not Main.Visible
	end
end)

-- Auto load fitur lain (autoaim.lua, esp.lua) jika file tersedia
pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/DeadMark666X/MarkHub/main/autoaim.lua"))() end)
pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/DeadMark666X/MarkHub/main/esp.lua"))() end)

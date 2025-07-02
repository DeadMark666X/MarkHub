-- MarkHub by DeadMark666X (Improved Version)
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

local CorrectKey = "MARK123" -- Ganti key di sini

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
ScreenGui.Name = "MarkHub"
ScreenGui.ResetOnSpawn = false

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 460, 0, 360)
MainFrame.Position = UDim2.new(0.5, -230, 0.5, -180)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.Parent = ScreenGui
MainFrame.Active = true
MainFrame.Draggable = true

-- Shadow
local Shadow = Instance.new("UICorner", MainFrame)
Shadow.CornerRadius = UDim.new(0, 12)

-- Header
local Header = Instance.new("TextLabel")
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
Header.Text = "MarkHub - Emergency Hamburg"
Header.TextColor3 = Color3.fromRGB(255, 255, 255)
Header.Font = Enum.Font.GothamBold
Header.TextSize = 20
Header.Parent = MainFrame

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 35, 0, 30)
CloseBtn.Position = UDim2.new(1, -40, 0, 5)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 18
CloseBtn.Parent = MainFrame
CloseBtn.MouseButton1Click:Connect(function()
	MainFrame.Visible = false
end)

-- Menu Buttons
local function createToggle(name, positionY)
	local Toggle = Instance.new("TextButton")
	Toggle.Size = UDim2.new(0.9, 0, 0, 40)
	Toggle.Position = UDim2.new(0.05, 0, 0, positionY)
	Toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
	Toggle.Font = Enum.Font.GothamBold
	Toggle.TextSize = 16
	Toggle.Text = name .. ": OFF"
	Toggle.Parent = MainFrame
	Toggle.MouseButton1Click:Connect(function()
		if Toggle.Text:find("OFF") then
			Toggle.Text = name .. ": ON"
			Toggle.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
			if name == "Aimbot" then _G.MarkHub_Aimbot = true end
			if name == "ESP" then _G.MarkHub_ESP = true end
		else
			Toggle.Text = name .. ": OFF"
			Toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			if name == "Aimbot" then _G.MarkHub_Aimbot = false end
			if name == "ESP" then _G.MarkHub_ESP = false end
		end
	end)
end

createToggle("Aimbot", 60)
createToggle("ESP", 110)

-- Key Input Frame
local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.new(0, 320, 0, 180)
KeyFrame.Position = UDim2.new(0.5, -160, 0.5, -90)
KeyFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
KeyFrame.BorderSizePixel = 0
KeyFrame.Parent = ScreenGui

local KeyBox = Instance.new("TextBox")
KeyBox.PlaceholderText = "Enter Key Here"
KeyBox.Size = UDim2.new(0.8, 0, 0, 40)
KeyBox.Position = UDim2.new(0.1, 0, 0.2, 0)
KeyBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.TextSize = 18
KeyBox.ClearTextOnFocus = false
KeyBox.Font = Enum.Font.Gotham
KeyBox.Parent = KeyFrame

local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Size = UDim2.new(0.8, 0, 0, 40)
SubmitBtn.Position = UDim2.new(0.1, 0, 0.6, 0)
SubmitBtn.Text = "Unlock Hub"
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.TextSize = 18
SubmitBtn.Parent = KeyFrame

SubmitBtn.MouseButton1Click:Connect(function()
	if KeyBox.Text == CorrectKey then
		KeyFrame:Destroy()
		MainFrame.Visible = true
	else
		KeyBox.Text = "Wrong Key!"
	end
end)

-- RightControl Toggle
UserInputService.InputBegan:Connect(function(input, processed)
	if processed then return end
	if input.KeyCode == Enum.KeyCode.RightControl then
		MainFrame.Visible = not MainFrame.Visible
	end
end)

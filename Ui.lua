-- MarkHub by DeadMark666X

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

local CorrectKey = "MARK123" -- GANTI KEY DI SINI

-- UI Utama
local ScreenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
ScreenGui.Name = "MarkHub"
ScreenGui.ResetOnSpawn = false

-- Frame utama (isi menu MarkHub)
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 420, 0, 320)
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -160)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.Parent = ScreenGui
MainFrame.Active = true
MainFrame.Draggable = true

-- Header merah
local Header = Instance.new("TextLabel")
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
Header.Text = "MarkHub"
Header.TextColor3 = Color3.fromRGB(255, 255, 255)
Header.Font = Enum.Font.GothamBold
Header.TextSize = 20
Header.Parent = MainFrame

-- Tombol Tutup
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

-- Frame Input Key
local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.new(0, 320, 0, 180)
KeyFrame.Position = UDim2.new(0.5, -160, 0.5, -90)
KeyFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
KeyFrame.BorderSizePixel = 0
KeyFrame.Parent = ScreenGui

-- Input Box
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

-- Tombol Submit
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

-- Tombol buka/tutup pakai RightControl
UserInputService.InputBegan:Connect(function(input, processed)
	if processed then return end
	if input.KeyCode == Enum.KeyCode.RightControl then
		MainFrame.Visible = not MainFrame.Visible
	end
end)

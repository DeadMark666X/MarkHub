-- MARK/HUB UI by DeadMark666X
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- UI Container
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MarkHubUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player:WaitForChild("PlayerGui")

-- Draggable Frame (Main Panel)
local Main = Instance.new("Frame")
Main.Name = "MainFrame"
Main.Size = UDim2.new(0, 400, 0, 300)
Main.Position = UDim2.new(0.5, -200, 0.5, -150)
Main.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
Main.BorderSizePixel = 0
Main.Visible = false
Main.Parent = ScreenGui

-- Make draggable
local UIS = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos
Main.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = Main.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

UIS.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - dragStart
		Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)

-- Title Bar
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
title.Text = "🔥 MARK/HUB - Emergency Hamburg"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20
title.Parent = Main

-- Logo Image
local logo = Instance.new("ImageLabel")
logo.Size = UDim2.new(0, 40, 0, 40)
logo.Position = UDim2.new(0, 0, 0, 0)
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://14890949821" -- Ganti ke ID logomu sendiri kalau ada
logo.Parent = title

-- Content Area (untuk tombol fitur nanti)
local content = Instance.new("Frame")
content.Name = "Content"
content.Size = UDim2.new(1, -20, 1, -60)
content.Position = UDim2.new(0, 10, 0, 50)
content.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
content.BorderSizePixel = 0
content.Parent = Main

-- Placeholder label
local text = Instance.new("TextLabel")
text.Size = UDim2.new(1, 0, 0, 30)
text.Position = UDim2.new(0, 0, 0, 10)
text.Text = "Coming soon... 🚧"
text.TextColor3 = Color3.new(1, 1, 1)
text.BackgroundTransparency = 1
text.Font = Enum.Font.SourceSans
text.TextSize = 18
text.Parent = content

-- Toggle Button (menu buka/tutup)
local toggle = Instance.new("TextButton")
toggle.Name = "MenuToggle"
toggle.Size = UDim2.new(0, 120, 0, 40)
toggle.Position = UDim2.new(0, 10, 0, 10)
toggle.Text = "☰ Open Menu"
toggle.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
toggle.TextColor3 = Color3.new(1, 1, 1)
toggle.Font = Enum.Font.SourceSansBold
toggle.TextSize = 16
toggle.Parent = ScreenGui

toggle.MouseButton1Click:Connect(function()
	Main.Visible = not Main.Visible
	toggle.Text = Main.Visible and "✖ Close Menu" or "☰ Open Menu"
end)

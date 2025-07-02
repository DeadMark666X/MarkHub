-- MARK HUB UI (Upgraded Red UI - NatHub Style)
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- Create GUI
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "MarkHubUI"
gui.ResetOnSpawn = false

-- Main Frame
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 450, 0, 320)
main.Position = UDim2.new(0.5, -225, 0.5, -160)
main.BackgroundColor3 = Color3.fromRGB(35, 0, 0)
main.BorderSizePixel = 0
main.Visible = false
main.Parent = gui

-- Rounded Corners
local UICorner = Instance.new("UICorner", main)
UICorner.CornerRadius = UDim.new(0, 12)

-- Shadow
local shadow = Instance.new("ImageLabel", main)
shadow.Size = UDim2.new(1, 30, 1, 30)
shadow.Position = UDim2.new(0, -15, 0, -15)
shadow.Image = "rbxassetid://1316045217"
shadow.ImageTransparency = 0.7
shadow.BackgroundTransparency = 1
shadow.ZIndex = 0

-- Title
local title = Instance.new("TextLabel", main)
title.Text = "🔥 Mark/Hub - Emergency Hamburg"
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.ZIndex = 2

local cornerTitle = Instance.new("UICorner", title)
cornerTitle.CornerRadius = UDim.new(0, 12)

-- Logo (optional)
local logo = Instance.new("ImageLabel", title)
logo.Image = "rbxassetid://14890949821" -- Ganti ID logomu kalau ada
logo.Size = UDim2.new(0, 40, 0, 40)
logo.Position = UDim2.new(0, 5, 0, 0)
logo.BackgroundTransparency = 1

-- Content Area
local content = Instance.new("Frame", main)
content.Size = UDim2.new(1, -20, 1, -60)
content.Position = UDim2.new(0, 10, 0, 50)
content.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
content.BorderSizePixel = 0
local contentCorner = Instance.new("UICorner", content)
contentCorner.CornerRadius = UDim.new(0, 10)

-- Placeholder Content
local label = Instance.new("TextLabel", content)
label.Text = "🚧 Features will be here soon"
label.TextSize = 18
label.Size = UDim2.new(1, 0, 0, 30)
label.TextColor3 = Color3.new(1, 1, 1)
label.BackgroundTransparency = 1
label.Position = UDim2.new(0, 0, 0, 5)
label.Font = Enum.Font.Gotham

-- Menu Toggle Button
local toggleBtn = Instance.new("TextButton", gui)
toggleBtn.Text = "☰ Menu"
toggleBtn.Size = UDim2.new(0, 120, 0, 40)
toggleBtn.Position = UDim2.new(0, 15, 0, 15)
toggleBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
toggleBtn.TextColor3 = Color3.new(1, 1, 1)
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 16
local toggleCorner = Instance.new("UICorner", toggleBtn)
toggleCorner.CornerRadius = UDim.new(0, 10)

toggleBtn.MouseButton1Click:Connect(function()
	main.Visible = not main.Visible
	toggleBtn.Text = main.Visible and "✖ Close" or "☰ Menu"
end)

-- Make Draggable
local dragging = false
local dragStart, startPos

main.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = main.Position

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
		main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)

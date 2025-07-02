local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera
local Drawing = Drawing or {}

getgenv().AimbotEnabled = getgenv().AimbotEnabled or false

-- Fungsi cari musuh terdekat
local function getClosestEnemy()
	local closest = nil
	local shortest = math.huge

	for _, player in pairs(Players:GetPlayers()) do
		if player ~= LocalPlayer then
			local char = player.Character
			if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChildOfClass("Humanoid") then
				local hrp = char.HumanoidRootPart
				local pos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
				if onScreen then
					local dist = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
					if dist < shortest then
						closest = player
						shortest = dist
					end
				end
			end
		end
	end

	return closest
end

-- Aimbot
RunService.RenderStepped:Connect(function()
	if getgenv().AimbotEnabled and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
		local target = getClosestEnemy()
		if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
			Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Character.HumanoidRootPart.Position)
		end
	end
end)

-- ESP Sistem
local function createESP(player)
	local name = Drawing.new("Text")
	name.Visible = true
	name.Center = true
	name.Size = 14
	name.Color = Color3.new(1, 0, 0) -- Merah

	RunService.RenderStepped:Connect(function()
		if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			local hrp = player.Character.HumanoidRootPart
			local pos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
			if onScreen then
				name.Position = Vector2.new(pos.X, pos.Y - 25)
				name.Text = player.Name
				name.Visible = true
			else
				name.Visible = false
			end
		else
			name.Visible = false
		end
	end)
end

-- Pasang ESP ke semua pemain selain LocalPlayer
for _, player in pairs(Players:GetPlayers()) do
	if player ~= LocalPlayer then
		createESP(player)
	end
end

-- Tambah ESP kalau ada player baru join
Players.PlayerAdded:Connect(function(player)
	if player ~= LocalPlayer then
		player.CharacterAdded:Connect(function()
			wait(1)
			createESP(player)
		end)
	end
end)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

-- RemoteEvent tembak
local FireEvent = ReplicatedStorage:WaitForChild("ZDD"):WaitForChild("0b6c4b19-e763-4590-b964-bbfc01b63348")

-- Cek apakah kita memegang senjata
local function isHoldingGun()
	local tool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
	if not tool then return false end
	local gunName = tool.Name:lower()
	return gunName:find("g36") or gunName:find("mp5") or gunName:find("glock") -- tambahkan senjata lain jika perlu
end

-- Cari target musuh terdekat (bukan LocalPlayer)
local function getClosestEnemy()
	local shortest = math.huge
	local closest = nil

	for _, player in pairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			local pos, onScreen = Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)
			if onScreen then
				local dist = (Vector2.new(pos.X, pos.Y) - Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)).Magnitude
				if dist < shortest then
					shortest = dist
					closest = player
				end
			end
		end
	end

	return closest
end

-- Looping auto-shoot saat pegang senjata
RunService.RenderStepped:Connect(function()
	if isHoldingGun() then
		local target = getClosestEnemy()
		if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
			-- Trigger tembakan
			FireEvent:FireServer()
		end
	end
end)

-- Aimbot untuk MarkHub - Emergency Hamburg
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera

-- Cek apakah player wanted
local function isWanted(player)
	if not player then return false end

	-- Cek leaderstats
	local stats = player:FindFirstChild("leaderstats")
	if stats then
		local wanted = stats:FindFirstChild("Wanted")
		if wanted and tonumber(wanted.Value) > 0 then
			return true
		end
	end

	-- Cek atribut langsung
	local wantedAttr = player:FindFirstChild("Wanted")
	if wantedAttr and wantedAttr:IsA("BoolValue") and wantedAttr.Value == true then
		return true
		end

	return false
end

-- Ambil musuh wanted terdekat dari kursor
local function getClosestWanted()
	local closest = nil
	local shortest = math.huge

	for _, player in pairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and isWanted(player) then
			local char = player.Character
			if char and char:FindFirstChild("HumanoidRootPart") then
				local hrp = char:FindFirstChild("HumanoidRootPart")
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

-- Aimbot aktif saat klik kiri (MouseButton1)
RunService.RenderStepped:Connect(function()
	if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
		local target = getClosestWanted()
		if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
			Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Character.HumanoidRootPart.Position)
		end
	end
end)

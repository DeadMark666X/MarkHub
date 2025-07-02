local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

_G.AimbotEnabled = _G.AimbotEnabled or false

local function getClosestPlayer()
	local closest, distance = nil, math.huge
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			local pos, onScreen = Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)
			if onScreen then
				local dist = (Vector2.new(pos.X, pos.Y) - Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)).Magnitude
				if dist < distance then
					distance = dist
					closest = player
				end
			end
		end
	end
	return closest
end

RunService.RenderStepped:Connect(function()
	if _G.AimbotEnabled and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
		local target = getClosestPlayer()
		if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
			Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Character.HumanoidRootPart.Position)
		end
	end
end)

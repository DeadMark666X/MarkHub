local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

_G.ESPEnabled = _G.ESPEnabled or false

local function createBillboard(player)
	local character = player.Character
	if not character or not character:FindFirstChild("Head") then return end

	if character:FindFirstChild("MarkHubESP") then return end

	local bb = Instance.new("BillboardGui", character.Head)
	bb.Name = "MarkHubESP"
	bb.Size = UDim2.new(0, 100, 0, 20)
	bb.AlwaysOnTop = true

	local label = Instance.new("TextLabel", bb)
	label.Size = UDim2.new(1, 0, 1, 0)
	label.Text = player.Name
	label.BackgroundTransparency = 1
	label.TextColor3 = Color3.new(1, 0, 0)
	label.TextStrokeTransparency = 0
	label.Font = Enum.Font.GothamBold
	label.TextScaled = true
end

RunService.RenderStepped:Connect(function()
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= Players.LocalPlayer then
			if _G.ESPEnabled then
				createBillboard(player)
			else
				if player.Character and player.Character:FindFirstChild("Head") then
					local old = player.Character.Head:FindFirstChild("MarkHubESP")
					if old then old:Destroy() end
				end
			end
		end
	end
end)

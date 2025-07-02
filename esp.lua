-- ESP by DeadMark666X
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local ESPEnabled = true
local ESPFolder = Instance.new("Folder", game.CoreGui)
ESPFolder.Name = "MarkHub_ESP"

-- Utility: Buat Box + Nama
local function createESP(player)
	if player == LocalPlayer then return end
	local char = player.Character
	if not char then return end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if not hrp then return end

	local box = Drawing.new("Square")
	box.Thickness = 2
	box.Transparency = 1
	box.Color = Color3.new(1, 0, 0) -- Default merah
	box.Filled = false

	local nameTag = Drawing.new("Text")
	nameTag.Size = 16
	nameTag.Center = true
	nameTag.Outline = true
	nameTag.Color = Color3.new(1, 1, 1)

	local function update()
		if not ESPEnabled or not player.Character or not hrp then
			box.Visible = false
			nameTag.Visible = false
			return
		end

		local pos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(hrp.Position)
		if onScreen then
			local size = Vector2.new(60, 100)
			box.Size = size
			box.Position = Vector2.new(pos.X - size.X / 2, pos.Y - size.Y / 2)
			box.Visible = true

			nameTag.Text = player.Name
			nameTag.Position = Vector2.new(pos.X, pos.Y - size.Y / 2 - 14)
			nameTag.Visible = true

			-- Highlight jika wanted
			local stats = player:FindFirstChild("leaderstats")
			if stats and stats:FindFirstChild("Wanted") and tonumber(stats.Wanted.Value) > 0 then
				box.Color = Color3.new(1, 1, 0) -- kuning untuk wanted
			else
				box.Color = Color3.new(1, 0, 0)
			end
		else
			box.Visible = false
			nameTag.Visible = false
		end
	end

	RunService.RenderStepped:Connect(update)
end

-- Pasang ESP untuk semua player yang ada
for _, player in ipairs(Players:GetPlayers()) do
	createESP(player)
end

-- Pasang ESP kalau ada player baru join
Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function()
		wait(1)
		createESP(player)
	end)
end)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Bersihkan ESP lama
if workspace:FindFirstChild("MarkHubESP") then
	workspace.MarkHubESP:Destroy()
end

local ESPFolder = Instance.new("Folder", workspace)
ESPFolder.Name = "MarkHubESP"

-- Fungsi untuk bikin ESP 1 pemain
local function createESP(player)
	if player == LocalPlayer then return end

	player.CharacterAdded:Connect(function(character)
		wait(1) -- Tunggu part muncul
		local head = character:WaitForChild("Head", 3)
		if not head then return end

		-- Cek dan hapus ESP lama
		if head:FindFirstChild("ESP") then
			head.ESP:Destroy()
		end

		local billboard = Instance.new("BillboardGui")
		billboard.Name = "ESP"
		billboard.Adornee = head
		billboard.Size = UDim2.new(0, 100, 0, 40)
		billboard.StudsOffset = Vector3.new(0, 2, 0)
		billboard.AlwaysOnTop = true
		billboard.Parent = head

		local text = Instance.new("TextLabel")
		text.Size = UDim2.new(1, 0, 1, 0)
		text.BackgroundTransparency = 1
		text.TextColor3 = Color3.fromRGB(255, 0, 0)
		text.TextStrokeTransparency = 0
		text.Font = Enum.Font.GothamBold
		text.TextScaled = true
		text.Text = player.Name
		text.Parent = billboard

		-- Kalau dia Wanted, ubah warna jadi kuning
		local function updateColor()
			local stats = player:FindFirstChild("leaderstats")
			if stats and stats:FindFirstChild("Wanted") and tonumber(stats.Wanted.Value) > 0 then
				text.TextColor3 = Color3.fromRGB(255, 255, 0) -- Wanted = Kuning
			else
				text.TextColor3 = Color3.fromRGB(255, 0, 0) -- Normal = Merah
			end
		end

		updateColor()
		task.spawn(function()
			while text.Parent and player.Parent do
				updateColor()
				wait(2)
			end
		end)
	end)
end

-- Pasang ke semua pemain yang sudah ada
for _, p in pairs(Players:GetPlayers()) do
	createESP(p)
end

-- Kalau ada player baru masuk
Players.PlayerAdded:Connect(createESP)

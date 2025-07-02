-- ✅ Mark/Hub UI (Rayfield Style)
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
   Name = "Mark/Hub - Emergency Hamburg",
   LoadingTitle = "Mark/Hub",
   LoadingSubtitle = "by DeadMark666X",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "MarkHub",
      FileName = "UIConfig"
   },
   Discord = {
      Enabled = false,
      Invite = "",
      RememberJoins = false
   },
   KeySystem = false
})

local Tab = Window:CreateTab("Main", 4483362458)
local Section = Tab:CreateSection("Auto Features")

Tab:CreateButton({
   Name = "Teleport to Dealer",
   Callback = function()
      -- Replace with actual dealer position
      local dealerPosition = Vector3.new(0, 0, 0)
      game.Players.LocalPlayer.Character:PivotTo(CFrame.new(dealerPosition))
   end,
})

Tab:CreateButton({
   Name = "Spawn Bike",
   Callback = function()
      -- Example placeholder: Replace with actual RemoteEvent to spawn bike
      local remote = game:GetService("ReplicatedStorage"):FindFirstChild("SpawnBike")
      if remote then remote:FireServer() end
   end,
})

Tab:CreateButton({
   Name = "Teleport to Bike",
   Callback = function()
      -- Replace with how to find the bike part
      local bike = workspace:FindFirstChild("Bike")
      if bike then
         game.Players.LocalPlayer.Character:PivotTo(bike.CFrame)
      end
   end,
})

Tab:CreateParagraph({Title = "Status", Content = "Welcome to Mark/Hub!"})

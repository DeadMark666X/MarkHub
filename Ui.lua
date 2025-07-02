-- MarkHub by DeadMark666X - Advanced Version (Tabbed UI) -- Buat game Emergency Hamburg dengan UI lebih rapi dan fitur Aimbot + ESP toggle

local Players = game:GetService("Players") local UserInputService = game:GetService("UserInputService") local RunService = game:GetService("RunService") local LocalPlayer = Players.LocalPlayer

local CorrectKey = "MARK123" -- Ganti sesuai kebutuhan

-- GUI Container local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui")) ScreenGui.Name = "MarkHub" ScreenGui.ResetOnSpawn = false

-- Key Prompt local KeyFrame = Instance.new("Frame") KeyFrame.Size = UDim2.new(0, 300, 0, 150) KeyFrame.Position = UDim2.new(0.5, -150, 0.5, -75) KeyFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) KeyFrame.Parent = ScreenGui

local KeyBox = Instance.new("TextBox", KeyFrame) KeyBox.Size = UDim2.new(0.8, 0, 0, 40) KeyBox.Position = UDim2.new(0.1, 0, 0.2, 0) KeyBox.PlaceholderText = "Enter Key Here" KeyBox.Text = "" KeyBox.TextSize = 18 KeyBox.TextColor3 = Color3.new(1,1,1) KeyBox.BackgroundColor3 = Color3.fromRGB(50,50,50) KeyBox.ClearTextOnFocus = false

local Submit = Instance.new("TextButton", KeyFrame) Submit.Size = UDim2.new(0.8, 0, 0, 40) Submit.Position = UDim2.new(0.1, 0, 0.6, 0) Submit.Text = "Unlock Hub" Submit.BackgroundColor3 = Color3.fromRGB(170, 0, 0) Submit.TextColor3 = Color3.new(1,1,1) Submit.TextSize = 18

-- Main UI Frame local MainFrame = Instance.new("Frame") MainFrame.Size = UDim2.new(0, 460, 0, 360) MainFrame.Position = UDim2.new(0.5, -230, 0.5, -180) MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25) MainFrame.Visible = false MainFrame.Parent = ScreenGui MainFrame.Active = true MainFrame.Draggable = true

-- Header local Header = Instance.new("TextLabel", MainFrame) Header.Size = UDim2.new(1, 0, 0, 40) Header.Text = "MarkHub - Emergency Hamburg" Header.TextSize = 20 Header.Font = Enum.Font.GothamBold Header.TextColor3 = Color3.new(1,1,1) Header.BackgroundColor3 = Color3.fromRGB(170, 0, 0)

local Close = Instance.new("TextButton", Header) Close.Size = UDim2.new(0, 40, 0, 30) Close.Position = UDim2.new(1, -45, 0, 5) Close.Text = "X" Close.Font = Enum.Font.GothamBold Close.TextSize = 18 Close.TextColor3 = Color3.new(1,1,1) Close.BackgroundColor3 = Color3.fromRGB(100,0,0) Close.MouseButton1Click:Connect(function() MainFrame.Visible = false end)

-- Tabs local TabHolder = Instance.new("Frame", MainFrame) TabHolder.Size = UDim2.new(0, 120, 1, -40) TabHolder.Position = UDim2.new(0, 0, 0, 40) TabHolder.BackgroundColor3 = Color3.fromRGB(40,40,40)

local ContentHolder = Instance.new("Frame", MainFrame) ContentHolder.Size = UDim2.new(1, -120, 1, -40) ContentHolder.Position = UDim2.new(0, 120, 0, 40) ContentHolder.BackgroundColor3 = Color3.fromRGB(35,35,35)

local Tabs = { {Name="Combat", Build=function(frame) local AimbotToggle = Instance.new("TextButton", frame) AimbotToggle.Size = UDim2.new(0, 180, 0, 40) AimbotToggle.Position = UDim2.new(0, 10, 0, 10) AimbotToggle.Text = "Toggle Aimbot" AimbotToggle.TextColor3 = Color3.new(1,1,1) AimbotToggle.BackgroundColor3 = Color3.fromRGB(170,0,0) AimbotToggle.MouseButton1Click:Connect(function() _G.AIMBOT_ENABLED = not _G.AIMBOT_ENABLED AimbotToggle.Text = _G.AIMBOT_ENABLED and "Aimbot: ON" or "Aimbot: OFF" end)

local ESPToggle = Instance.new("TextButton", frame)
    ESPToggle.Size = UDim2.new(0, 180, 0, 40)
    ESPToggle.Position = UDim2.new(0, 10, 0, 60)
    ESPToggle.Text = "Toggle ESP"
    ESPToggle.TextColor3 = Color3.new(1,1,1)
    ESPToggle.BackgroundColor3 = Color3.fromRGB(170,0,0)
    ESPToggle.MouseButton1Click:Connect(function()
        _G.ESP_ENABLED = not _G.ESP_ENABLED
        ESPToggle.Text = _G.ESP_ENABLED and "ESP: ON" or "ESP: OFF"
    end)
end},

}

for i, tab in ipairs(Tabs) do local btn = Instance.new("TextButton", TabHolder) btn.Size = UDim2.new(1, 0, 0, 40) btn.Position = UDim2.new(0, 0, 0, (i - 1) * 45) btn.Text = tab.Name btn.BackgroundColor3 = Color3.fromRGB(60, 0, 0) btn.TextColor3 = Color3.new(1, 1, 1) btn.MouseButton1Click:Connect(function() ContentHolder:ClearAllChildren() tab.Build(ContentHolder) end) end

-- Unlock Hub Submit.MouseButton1Click:Connect(function() if KeyBox.Text == CorrectKey then KeyFrame:Destroy() MainFrame.Visible = true else KeyBox.Text = "Wrong Key!" end end)

-- Toggle via RightControl UserInputService.InputBegan:Connect(function(input, gpe) if gpe then return end if input.KeyCode == Enum.KeyCode.RightControl then MainFrame.Visible = not MainFrame.Visible end end)

-- Aimbot basic (run only if enabled) RunService.RenderStepped:Connect(function() if _G.AIMBOT_ENABLED then local mouse = LocalPlayer:GetMouse() local cam = workspace.CurrentCamera local closest, dist = nil, math.huge

for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local pos, onScreen = cam:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
            if onScreen then
                local mag = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).Magnitude
                if mag < dist then
                    closest = plr
                    dist = mag
                end
            end
        end
    end

    if closest and closest.Character and closest.Character:FindFirstChild("HumanoidRootPart") then
        cam.CFrame = CFrame.new(cam.CFrame.Position, closest.Character.HumanoidRootPart.Position)
    end
end

end)

-- Simple ESP (name tag) RunService.RenderStepped:Connect(function() if not _G.ESP_ENABLED then return end for _, plr in pairs(Players:GetPlayers()) do if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("Head") then if not plr.Character.Head:FindFirstChild("ESP") then local tag = Instance.new("BillboardGui", plr.Character.Head) tag.Name = "ESP" tag.Size = UDim2.new(0,100,0,40) tag.AlwaysOnTop = true local text = Instance.new("TextLabel", tag) text.Size = UDim2.new(1,0,1,0) text.BackgroundTransparency = 1 text.Text = plr.Name text.TextColor3 = Color3.new(1,0,0) text.TextScaled = true end end end end)


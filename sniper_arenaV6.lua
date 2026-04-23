--// Grok 4.1 Unchained - FULL CHEAT MENU 2026 - RED WALLHACK + POLO AIM FIXED //
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

--====================== SETTINGS ======================
local Cheat = {
    Aimbot = {Enabled = true, Smooth = 2, TriggerBot = true, VisCheck = false},
    ESP = {Enabled = true, Name = true, Health = true, Distance = true, Tracer = true, Highlight = true},
    NoClip = {Enabled = false}
}

--====================== MENU ======================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GrokUnchained2026"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 440, 0, 620)
Main.Position = UDim2.new(0.5, -220, 0.5, -310)
Main.BackgroundColor3 = Color3.fromRGB(10, 10, 18)
Main.BorderSizePixel = 0
Main.Parent = ScreenGui

local UICorner = Instance.new("UICorner"); UICorner.CornerRadius = UDim.new(0, 12); UICorner.Parent = Main

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 65)
Title.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
Title.Text = "CHEAT MENU 1.6 - ODY92"
Title.TextColor3 = Color3.new(1,1,1)
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 23
Title.Parent = Main

local TitleCorner = Instance.new("UICorner"); TitleCorner.CornerRadius = UDim.new(0, 12); TitleCorner.Parent = Title

local Scrolling = Instance.new("ScrollingFrame")
Scrolling.Size = UDim2.new(1, -20, 1, -85)
Scrolling.Position = UDim2.new(0, 10, 0, 75)
Scrolling.BackgroundTransparency = 1
Scrolling.ScrollBarThickness = 6
Scrolling.ScrollBarImageColor3 = Color3.fromRGB(170, 0, 255)
Scrolling.Parent = Main

local ListLayout = Instance.new("UIListLayout"); ListLayout.SortOrder = Enum.SortOrder.LayoutOrder; ListLayout.Padding = UDim.new(0, 8); ListLayout.Parent = Scrolling
local Padding = Instance.new("UIPadding"); Padding.PaddingLeft = UDim.new(0,10); Padding.PaddingRight = UDim.new(0,10); Padding.PaddingTop = UDim.new(0,10); Padding.Parent = Scrolling

local function AddToggle(name, default, callback)
    local f = Instance.new("Frame"); f.Size = UDim2.new(1,-20,0,50); f.BackgroundColor3 = Color3.fromRGB(20,20,30); f.Parent = Scrolling
    local corner = Instance.new("UICorner"); corner.CornerRadius = UDim.new(0,8); corner.Parent = f
    local lbl = Instance.new("TextLabel"); lbl.Size = UDim2.new(0.65,0,1,0); lbl.BackgroundTransparency = 1; lbl.Text = name; lbl.TextSize = 20; lbl.TextColor3 = Color3.new(1,1,1); lbl.Font = Enum.Font.Gotham; lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.Parent = f
    local btn = Instance.new("TextButton"); btn.Size = UDim2.new(0,80,0,32); btn.Position = UDim2.new(0.78,0,0.5,-16); btn.TextSize = 21; btn.BackgroundColor3 = default and Color3.fromRGB(0,255,120) or Color3.fromRGB(255,40,40); btn.Text = default and "ON" or "OFF"; btn.TextColor3 = Color3.new(1,1,1); btn.Font = Enum.Font.GothamBold; btn.Parent = f
    local btnCorner = Instance.new("UICorner"); btnCorner.CornerRadius = UDim.new(0,8); btnCorner.Parent = btn
    btn.MouseButton1Click:Connect(function()
        default = not default
        btn.BackgroundColor3 = default and Color3.fromRGB(0,255,120) or Color3.fromRGB(255,40,40)
        btn.Text = default and "ON" or "OFF"
        callback(default)
    end)
end

local function AddSlider(name, min, max, def, callback)
    local f = Instance.new("Frame"); f.Size = UDim2.new(1,-20,0,70); f.BackgroundColor3 = Color3.fromRGB(20,20,30); f.Parent = Scrolling
    local corner = Instance.new("UICorner"); corner.CornerRadius = UDim.new(0,8); corner.Parent = f
    local lbl = Instance.new("TextLabel"); lbl.Size = UDim2.new(1,0,0,25); lbl.TextSize = 20; lbl.BackgroundTransparency = 1; lbl.Text = name..": "..def; lbl.TextColor3 = Color3.new(1,1,1); lbl.Font = Enum.Font.Gotham; lbl.Parent = f
    local bar = Instance.new("Frame"); bar.Size = UDim2.new(1,-20,0,14); bar.Position = UDim2.new(0,10,0.55,0); bar.BackgroundColor3 = Color3.fromRGB(35,35,45); bar.Parent = f
    local barCorner = Instance.new("UICorner"); barCorner.CornerRadius = UDim.new(0,7); barCorner.Parent = bar
    local fill = Instance.new("Frame"); fill.Size = UDim2.new((def-min)/(max-min),0,1,0); fill.BackgroundColor3 = Color3.fromRGB(170,0,255); fill.Parent = bar
    local fillCorner = Instance.new("UICorner"); fillCorner.CornerRadius = UDim.new(0,7); fillCorner.Parent = fill
    local dragging = false
    bar.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true end end)
    UserInputService.InputEnded:Connect(function() dragging = false end)
    UserInputService.InputChanged:Connect(function(i)
        if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then
            local pos = math.clamp((i.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
            local val = math.floor(min + (max - min) * pos * 100)/100
            fill.Size = UDim2.new(pos, 0, 1, 0)
            lbl.Text = name .. ": " .. val
            callback(val)
        end
    end)
end

-- === TOUTES LES OPTIONS ===
AddToggle("Aimbot Enabled", Cheat.Aimbot.Enabled, function(v) Cheat.Aimbot.Enabled = v end)
AddToggle("Auto Fire (TriggerBot)", Cheat.Aimbot.TriggerBot, function(v) Cheat.Aimbot.TriggerBot = v end)
AddToggle("Visible Check", Cheat.Aimbot.VisCheck, function(v) Cheat.Aimbot.VisCheck = v end)
AddSlider("Aimbot Smoothness", 1, 10, Cheat.Aimbot.Smooth, function(v) Cheat.Aimbot.Smooth = v end)

AddToggle("ESP Enabled", Cheat.ESP.Enabled, function(v) Cheat.ESP.Enabled = v end)
AddToggle("ESP Name", Cheat.ESP.Name, function(v) Cheat.ESP.Name = v end)
AddToggle("ESP Health", Cheat.ESP.Health, function(v) Cheat.ESP.Health = v end)
AddToggle("ESP Distance", Cheat.ESP.Distance, function(v) Cheat.ESP.Distance = v end)
AddToggle("ESP Tracer", Cheat.ESP.Tracer, function(v) Cheat.ESP.Tracer = v end)
AddToggle("ESP Highlight (Red Box)", Cheat.ESP.Highlight, function(v) Cheat.ESP.Highlight = v end)

AddToggle("No-Clip", Cheat.NoClip.Enabled, function(v) Cheat.NoClip.Enabled = v end)

-- Draggable + Touche K
local dragging, dragStart, startPos
Title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true; dragStart = input.Position; startPos = Main.Position
    end
end)
Title.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.K then Main.Visible = not Main.Visible end
end)

--====================== ESP SYSTEM ======================
local Highlights = {}
local function CreateHighlight(plr)
    if plr == LocalPlayer then return end
    local char = plr.Character or plr.CharacterAdded:Wait()
    local highlight = Instance.new("Highlight")
    highlight.Adornee = char
    highlight.FillColor = Color3.fromRGB(255, 0, 0)
    highlight.OutlineColor = Color3.fromRGB(255, 80, 80)
    highlight.FillTransparency = 0.35
    highlight.OutlineTransparency = 0
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Enabled = Cheat.ESP.Highlight
    highlight.Parent = char
    Highlights[plr] = highlight
end
for _, plr in ipairs(Players:GetPlayers()) do CreateHighlight(plr) end
Players.PlayerAdded:Connect(CreateHighlight)
Players.PlayerRemoving:Connect(function(plr) if Highlights[plr] then Highlights[plr]:Destroy() end end)

local ESPObjects = {}
local function CreateESP(plr)
    if plr == LocalPlayer then return end
    local name = Drawing.new("Text"); name.Size=17; name.Center=true; name.Outline=true; name.Color=Color3.new(1,1,1)
    local health = Drawing.new("Text"); health.Size=15; health.Center=true; health.Outline=true; health.Color=Color3.fromRGB(0,255,120)
    local dist = Drawing.new("Text"); dist.Size=14; dist.Center=true; dist.Outline=true; dist.Color=Color3.new(1,1,1)
    local tracer = Drawing.new("Line"); tracer.Thickness=1.8; tracer.Color=Color3.fromRGB(255,0,0)
    ESPObjects[plr] = {Name=name, Health=health, Distance=dist, Tracer=tracer}
end
for _, plr in ipairs(Players:GetPlayers()) do CreateESP(plr) end
Players.PlayerAdded:Connect(CreateESP)

--====================== AIMBOT + TRIGGER (POLO) ======================
local function isVisible(target)
    if not Cheat.Aimbot.VisCheck then return true end
    local origin = Camera.CFrame.Position
    local direction = (target.Position - origin).Unit * 600
    local params = RaycastParams.new()
    params.FilterDescendantsInstances = {LocalPlayer.Character}
    params.FilterType = Enum.RaycastFilterType.Blacklist
    local result = workspace:Raycast(origin, direction, params)
    return not result or result.Instance:IsDescendantOf(target.Parent)
end

local function GetClosest()
    local closest, shortest = nil, 9999
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr == LocalPlayer or not plr.Character or not plr.Character:FindFirstChild("Head") then continue end
        local head = plr.Character.Head
        if not isVisible(head) then continue end
        local screen, onScreen = Camera:WorldToViewportPoint(head.Position)
        if onScreen then
            local mouse = UserInputService:GetMouseLocation()
            local dist = (Vector2.new(screen.X, screen.Y) - mouse).Magnitude
            if dist < shortest then
                shortest = dist
                closest = plr
            end
        end
    end
    return closest
end

--====================== MAIN LOOP ======================
RunService.RenderStepped:Connect(function()
    -- NoClip
    if Cheat.NoClip.Enabled then
        local character = LocalPlayer.Character
        if character then
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") and part.CanCollide then
                    part.CanCollide = false
                end
            end
        end
    end

    -- Aimbot (Right Click)
    if Cheat.Aimbot.Enabled and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
        local targetPlr = GetClosest()
        if targetPlr and targetPlr.Character and targetPlr.Character:FindFirstChild("Head") then
            local targetPos = targetPlr.Character.Head.Position
            local screenPos = Camera:WorldToViewportPoint(targetPos)
            local mousePos = UserInputService:GetMouseLocation()
            local diffX = screenPos.X - mousePos.X
            local diffY = screenPos.Y - mousePos.Y
            mousemoverel(diffX / Cheat.Aimbot.Smooth, diffY / Cheat.Aimbot.Smooth)
        end
    end

    -- Auto Fire (TriggerBot)
    if Cheat.Aimbot.TriggerBot and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
        local target = Mouse.Target
        if target and target.Parent and target.Parent:FindFirstChild("Humanoid") and target.Parent.Humanoid.Health > 0 then
            mouse1click()
            task.wait(0.007 + math.random(1,3)/1000)
        end
    end

    -- ESP
    for plr, drawings in pairs(ESPObjects) do
        if Highlights[plr] then
            Highlights[plr].Enabled = Cheat.ESP.Enabled and Cheat.ESP.Highlight
        end

        if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and Cheat.ESP.Enabled then
            local root = plr.Character.HumanoidRootPart
            local head = plr.Character:FindFirstChild("Head") or root
            local hum = plr.Character:FindFirstChild("Humanoid")
            local screen, onScreen = Camera:WorldToViewportPoint(root.Position)

            if onScreen then
                local top = Camera:WorldToViewportPoint(head.Position + Vector3.new(0,2.5,0))
                local bottom = Camera:WorldToViewportPoint(root.Position - Vector3.new(0,3,0))

                drawings.Name.Visible = Cheat.ESP.Name
                if Cheat.ESP.Name then 
                    drawings.Name.Text = plr.Name
                    drawings.Name.Position = Vector2.new(screen.X, top.Y-22)
                end

                drawings.Health.Visible = Cheat.ESP.Health
                if Cheat.ESP.Health and hum then 
                    drawings.Health.Text = math.floor(hum.Health).." HP"
                    drawings.Health.Position = Vector2.new(screen.X, top.Y-40)
                end

                drawings.Distance.Visible = Cheat.ESP.Distance
                if Cheat.ESP.Distance then 
                    drawings.Distance.Text = math.floor((LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and (LocalPlayer.Character.HumanoidRootPart.Position - root.Position).Magnitude) or 0).."m"
                    drawings.Distance.Position = Vector2.new(screen.X, bottom.Y+8)
                end

                drawings.Tracer.Visible = Cheat.ESP.Tracer
                if Cheat.ESP.Tracer then
                    drawings.Tracer.From = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y)
                    drawings.Tracer.To = Vector2.new(screen.X, screen.Y)
                end
            else
                for _, d in pairs(drawings) do d.Visible = false end
            end
        else
            for _, d in pairs(drawings) do d.Visible = false end
        end
    end
end)

Main.Visible = true

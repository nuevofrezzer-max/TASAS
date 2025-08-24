-- YiamHub v2 - GUI Estética + AutoFarm
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local rs = game:GetService("ReplicatedStorage")
local events = rs:WaitForChild("Events")

-- GUI Setup
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "YiamHub"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 350)
frame.Position = UDim2.new(0.5, -150, 0.5, -175)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
frame.AnchorPoint = Vector2.new(0.5, 0.5)

-- Estética
local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 12)

local shadow = Instance.new("ImageLabel", frame)
shadow.Size = UDim2.new(1, 30, 1, 30)
shadow.Position = UDim2.new(0, -15, 0, -15)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://1316045217"
shadow.ImageTransparency = 0.5
shadow.ZIndex = 0

-- Título
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "🧠 Yiam Hub"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.ZIndex = 2

-- Toggle buttons
local toggles = {
    Energy = false,
    Hunger = false,
    Mood = false,
    Record = false,
    Upgrade = false
}

local function createToggle(name, yPos)
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(0.9, 0, 0, 35)
    btn.Position = UDim2.new(0.05, 0, 0, yPos)
    btn.Text = "🔘 Activar " .. name
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 18
    btn.ZIndex = 2

    local btnCorner = Instance.new("UICorner", btn)
    btnCorner.CornerRadius = UDim.new(0, 8)

    btn.MouseButton1Click:Connect(function()
        toggles[name] = not toggles[name]
        btn.Text = (toggles[name] and "✅ Desactivar " or "🔘 Activar ") .. name
        btn.BackgroundColor3 = toggles[name] and Color3.fromRGB(0, 170, 255) or Color3.fromRGB(45, 45, 45)
    end)
end

createToggle("Energy", 50)
createToggle("Hunger", 95)
createToggle("Mood", 140)
createToggle("Record", 185)
createToggle("Upgrade", 230)

-- Safe event trigger
local function safeFire(eventName, ...)
    local event = events:FindFirst
-- Hanif Style [Modded] - Blue Lock: Rivals (Client-side Mod)
-- Full client-side script to replace current style visuals and skills

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local replicatedStorage = game:GetService("ReplicatedStorage")
local uis = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")

-- GUI Style Replacement
local function overrideStyleUI()
    local styleGui = player:WaitForChild("PlayerGui"):WaitForChild("MainUI"):WaitForChild("Aliran"):WaitForChild("CurrentStyle")
    styleGui.StyleName.Text = "Hanif [Modded]"
    styleGui.Description.Text = "Penguasa lapangan dengan gaya main ekstrem dan skill brutal."
    styleGui.Icon.Image = "rbxassetid://15792450065" -- contoh icon custom
end

-- VFX Skill Templates
local function playVFX(name)
    local effect = Instance.new("BillboardGui")
    effect.Size = UDim2.new(0, 200, 0, 50)
    effect.StudsOffset = Vector3.new(0, 4, 0)
    effect.Adornee = character:FindFirstChild("Head")
    effect.AlwaysOnTop = true

    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1, 0, 1, 0)
    text.BackgroundTransparency = 1
    text.TextColor3 = Color3.new(1, 0.2, 0.2)
    text.TextStrokeTransparency = 0
    text.TextScaled = true
    text.Font = Enum.Font.GothamBlack
    text.Text = name
    text.Parent = effect

    effect.Parent = character
    game.Debris:AddItem(effect, 1.5)
end

-- Hanif Skill Abilities
local function Nutmeg()
    playVFX("Nutmeg")
    -- Custom animation/effect here
end

local function SeriousShoot()
    playVFX("Serious Shoot")
    -- Custom animation/effect here
end

local function BackheelShoot()
    playVFX("Backheel Shoot")
    -- Custom animation/effect here
end

local function AbsoluteShoot()
    playVFX("Absolute Shoot")
    -- Custom animation/effect here
end

-- Android-friendly GUI
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 180, 0, 220)
frame.Position = UDim2.new(0.85, 0, 0.5, -110)
frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
frame.BackgroundTransparency = 0.3
frame.BorderSizePixel = 0

local skills = {
    {"Nutmeg", Nutmeg},
    {"Serious", SeriousShoot},
    {"Backheel", BackheelShoot},
    {"Absolute", AbsoluteShoot},
}

for i, skill in ipairs(skills) do
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(1, -10, 0, 40)
    btn.Position = UDim2.new(0, 5, 0, (i - 1) * 50 + 5)
    btn.Text = skill[1]
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    btn.TextScaled = true
    btn.MouseButton1Click:Connect(skill[2])
end

-- Run override
overrideStyleUI()

StarterGui:SetCore("SendNotification", {
    Title = "Hanif Style [Modded]",
    Text = "Activated successfully!",
    Duration = 5
})


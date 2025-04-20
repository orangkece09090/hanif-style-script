-- Hanif Style Blue Lock: Rivals
local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Debris = game:GetService("Debris")
local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

-- GUI untuk menampilkan Hanif Style
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "HanifStyleGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local label = Instance.new("TextLabel")
label.Parent = screenGui
label.Text = "Hanif Style Activated!"
label.Size = UDim2.new(0, 300, 0, 50)
label.Position = UDim2.new(0.5, -150, 0.1, 0)
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
label.BackgroundTransparency = 0.3
label.TextScaled = true
label.Font = Enum.Font.GothamBold

-- Fungsi untuk efek aura sederhana
local function playAura(color)
    local aura = Instance.new("ParticleEmitter", hrp)
    aura.Color = ColorSequence.new(color)
    aura.Size = NumberSequence.new(2)
    aura.Lifetime = NumberRange.new(1)
    aura.Rate = 50
    aura.Texture = "rbxassetid://1049219075" -- Ganti dengan ID tekstur partikel yang kamu suka
    Debris:AddItem(aura, 2)
end

-- Kemampuan Skill 1: Nutmeg (Bachira Style)
local function nutmeg()
    hrp.CFrame = hrp.CFrame * CFrame.new(5, 0, 0)
    playAura(Color3.fromRGB(255, 255, 0)) -- Aura kuning
end

-- Kemampuan Skill 2: Serious Shoot (Ledakan aura biru, cyan, putih)
local function seriousShoot()
    playAura(Color3.fromRGB(0, 255, 255)) -- Aura cyan
    playAura(Color3.fromRGB(0, 0, 255))   -- Aura biru
end

-- Kemampuan Skill 3: Backheel Shoot
local function backheelShoot()
    hrp.CFrame = hrp.CFrame * CFrame.new(7, 0, 0) -- Dribble lebih cepat
    playAura(Color3.fromRGB(255, 0, 0)) -- Aura merah
end

-- Kemampuan Skill 4: Absolute Shoot (Ledakan OP dengan aura putih, cyan, biru)
local function absoluteShoot()
    playAura(Color3.fromRGB(255, 255, 255)) -- Aura putih
    playAura(Color3.fromRGB(0, 0, 255))     -- Aura biru
    playAura(Color3.fromRGB(0, 255, 255))   -- Aura cyan
end

-- Input pengguna untuk mengaktifkan kemampuan
UIS.InputBegan:Connect(function(input, gp)
    if gp then return end
    local key = input.KeyCode
    if key == Enum.KeyCode.Z then
        nutmeg() -- Nutmeg (Bachira style)
    elseif key == Enum.KeyCode.X then
        seriousShoot() -- Serious Shoot
    elseif key == Enum.KeyCode.C then
        backheelShoot() -- Backheel Shoot
    elseif key == Enum.KeyCode.V then
        absoluteShoot() -- Absolute Shoot
    end
end)

-- Hapus GUI setelah 10 detik
wait(10)
label:Remove()

-- Hanif Style Mobile GUI + Skill Script (Blue Lock: Rivals)
local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Debris = game:GetService("Debris")
local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

-- GUI Utama
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "HanifStyleMobile"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Fungsi buat bikin tombol
local function buatTombol(nama, pos, warna, aksi)
    local tombol = Instance.new("TextButton")
    tombol.Text = nama
    tombol.Size = UDim2.new(0, 120, 0, 40)
    tombol.Position = pos
    tombol.BackgroundColor3 = warna
    tombol.TextColor3 = Color3.new(1,1,1)
    tombol.TextScaled = true
    tombol.Font = Enum.Font.GothamBold
    tombol.Parent = screenGui

    tombol.MouseButton1Click:Connect(function()
        aksi()
    end)
end

-- Efek aura
local function playAura(color)
    local aura = Instance.new("ParticleEmitter", hrp)
    aura.Color = ColorSequence.new(color)
    aura.Size = NumberSequence.new(2)
    aura.Lifetime = NumberRange.new(1)
    aura.Rate = 50
    aura.Texture = "rbxassetid://1049219075"
    Debris:AddItem(aura, 2)
end

-- Skill
local function nutmeg()
    hrp.CFrame = hrp.CFrame * CFrame.new(5, 0, 0)
    playAura(Color3.fromRGB(255, 255, 0))
end

local function seriousShoot()
    playAura(Color3.fromRGB(0, 255, 255))
    playAura(Color3.fromRGB(0, 0, 255))
end

local function backheelShoot()
    hrp.CFrame = hrp.CFrame * CFrame.new(7, 0, 0)
    playAura(Color3.fromRGB(255, 0, 0))
end

local function absoluteShoot()
    playAura(Color3.fromRGB(255, 255, 255))
    playAura(Color3.fromRGB(0, 0, 255))
    playAura(Color3.fromRGB(0, 255, 255))
end

-- Tombol di layar
buatTombol("Nutmeg", UDim2.new(0.05, 0, 0.7, 0), Color3.fromRGB(255, 170, 0), nutmeg)
buatTombol("Serious", UDim2.new(0.3, 0, 0.7, 0), Color3.fromRGB(0, 200, 255), seriousShoot)
buatTombol("Backheel", UDim2.new(0.55, 0, 0.7, 0), Color3.fromRGB(255, 0, 100), backheelShoot)
buatTombol("Absolute", UDim2.new(0.8, 0, 0.7, 0), Color3.fromRGB(255, 255, 255), absoluteShoot)

-- Label info
local label = Instance.new("TextLabel")
label.Parent = screenGui
label.Text = "Hanif Style Activated!"
label.Size = UDim2.new(0, 300, 0, 40)
label.Position = UDim2.new(0.5, -150, 0.05, 0)
label.TextColor3 = Color3.new(1,1,1)
label.BackgroundColor3 = Color3.new(0,0,0)
label.BackgroundTransparency = 0.3
label.TextScaled = true
label.Font = Enum.Font.GothamBold

-- Hapus tulisan setelah 8 detik
task.delay(8, function()
    if label then
        label:Destroy()
    end
end)

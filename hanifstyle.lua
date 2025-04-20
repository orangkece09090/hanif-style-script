-- Hanif Style (Client Style Spoof + Skill Override)
local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Debris = game:GetService("Debris")
local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

-- [1] Ganti teks UI style jadi “Hanif Style”
task.wait(3) -- tunggu UI muncul dulu
for _, ui in ipairs(player:WaitForChild("PlayerGui"):GetDescendants()) do
    if ui:IsA("TextLabel") or ui:IsA("TextButton") then
        if string.find(ui.Text:lower(), "style") then
            ui.Text = "Hanif Style"
        end
    end
end

-- [2] Fungsi aura efek
local function playAura(color)
    local aura = Instance.new("ParticleEmitter")
    aura.Color = ColorSequence.new(color)
    aura.Size = NumberSequence.new(1.5)
    aura.Lifetime = NumberRange.new(0.5)
    aura.Rate = 100
    aura.Texture = "rbxassetid://1049219075"
    aura.VelocitySpread = 180
    aura.Speed = NumberRange.new(4)
    aura.Parent = hrp
    Debris:AddItem(aura, 1.5)
end

-- [3] Abilities
local function nutmeg()
    playAura(Color3.fromRGB(255, 255, 0))
    hrp.CFrame = hrp.CFrame * CFrame.new(3, 0, 0)
end

local function seriousShoot()
    for _, col in ipairs({
        Color3.fromRGB(0, 255, 255),
        Color3.fromRGB(0, 0, 255),
        Color3.fromRGB(255, 255, 255)
    }) do
        playAura(col)
    end
end

local function backheelShoot()
    playAura(Color3.fromRGB(255, 100, 0))
    hrp.CFrame = hrp.CFrame * CFrame.new(0, 0, -6)
end

local function absoluteShoot()
    for _, col in ipairs({
        Color3.fromRGB(255, 255, 255),
        Color3.fromRGB(0, 255, 255),
        Color3.fromRGB(0, 0, 255),
        Color3.fromRGB(0, 0, 0)
    }) do
        playAura(col)
    end
    local bv = Instance.new("BodyVelocity")
    bv.Velocity = hrp.CFrame.LookVector * 80
    bv.MaxForce = Vector3.new(1e5, 1e5, 1e5)
    bv.Parent = hrp
    Debris:AddItem(bv, 0.4)
end

-- [4] Keybind
UIS.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.Z then
        nutmeg()
    elseif input.KeyCode == Enum.KeyCode.X then
        seriousShoot()
    elseif input.KeyCode == Enum.KeyCode.C then
        backheelShoot()
    elseif input.KeyCode == Enum.KeyCode.V then
        absoluteShoot()
    end
end)

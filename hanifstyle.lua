-- Hanif Style Blue Lock: Rivals (Client-Side Only) -- by @LYNCX - Custom Style Script

local UIS = game:GetService("UserInputService") local Players = game:GetService("Players") local Debris = game:GetService("Debris") local player = Players.LocalPlayer local char = player.Character or player.CharacterAdded:Wait() local hrp = char:WaitForChild("HumanoidRootPart")

-- EFFECT HANDLER local function createAura(color, size, lifetime, texture) local aura = Instance.new("ParticleEmitter") aura.Color = ColorSequence.new(color) aura.Size = NumberSequence.new(size or 2) aura.Lifetime = NumberRange.new(lifetime or 1) aura.Rate = 50 aura.Speed = NumberRange.new(0, 0) aura.Texture = texture or "rbxassetid://1049219075" aura.Parent = hrp Debris:AddItem(aura, 2) end

-- HANIF STYLE INTRO local gui = Instance.new("BillboardGui", hrp) gui.Size = UDim2.new(5, 0, 2, 0) gui.StudsOffset = Vector3.new(0, 4, 0) gui.AlwaysOnTop = true

local text = Instance.new("TextLabel", gui) text.Size = UDim2.new(1, 0, 1, 0) text.BackgroundTransparency = 1 text.Text = "HANIF STYLE" text.TextColor3 = Color3.fromRGB(0, 255, 255) text.TextStrokeTransparency = 0 text.TextScaled = true text.Font = Enum.Font.GothamBlack Debris:AddItem(gui, 5)

-- SKILL 1: Nutmeg (Z) local function nutmeg() local direction = hrp.CFrame.lookVector hrp.CFrame = hrp.CFrame + direction * 6 createAura(Color3.fromRGB(255, 255, 0), 2, 1) end

-- SKILL 2: Serious Shoot (X) local function seriousShoot() createAura(Color3.fromRGB(0, 255, 255), 2, 1.5) createAura(Color3.fromRGB(0, 0, 255), 3, 1.5) createAura(Color3.fromRGB(255, 255, 255), 4, 2) end

-- SKILL 3: Backheel Shoot (C) local function backheelShoot() local direction = hrp.CFrame.lookVector hrp.CFrame = hrp.CFrame + direction * 5 createAura(Color3.fromRGB(255, 0, 0), 2.5, 1) end

-- SKILL 4: Absolute Shoot (V) local function absoluteShoot() createAura(Color3.fromRGB(255, 255, 255), 3, 2) createAura(Color3.fromRGB(0, 255, 255), 3, 2) createAura(Color3.fromRGB(0, 0, 255), 3, 2) createAura(Color3.fromRGB(0, 0, 0), 4, 1.5) end

-- BIND SKILLS UIS.InputBegan:Connect(function(input, gpe) if gpe then return end local key = input.KeyCode if key == Enum.KeyCode.Z then nutmeg() elseif key == Enum.KeyCode.X then seriousShoot() elseif key == Enum.KeyCode.C then backheelShoot() elseif key == Enum.KeyCode.V then absoluteShoot() end end)

-- DONE


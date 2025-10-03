if game.PlaceId == 92811427244720 then
    -- ====================
    -- SERVICES
    -- ====================
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local TweenService = game:GetService("TweenService")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local UserInputService = game:GetService("UserInputService")

    -- ====================
    -- PLAYER REFERENCES
    -- ====================
    local lp = Players.LocalPlayer
    local function getCharacter()
        return lp.Character or lp.CharacterAdded:Wait()
    end
    
    local function getHRP()
        local char = getCharacter()
        return char:WaitForChild("HumanoidRootPart")
    end

    local function getHumanoid()
        local char = lp.Character
        return char and char:FindFirstChildOfClass("Humanoid")
    end

    -- ====================
    -- GAME DATA - MOUNT YNTKTS
    -- ====================
    local GameData = {
        Checkpoints = {
            CFrame.new(-663.5, 56.6999931, -444.300018, 1, 0, 0, 0, 1, 0, 0, 0, 1),
            CFrame.new(-44.8496742, 51.0258789, -553.84375, 0.920062542, 0, 0.391771466, 0, 1, 0, -0.391771466, 0, 0.920062542),
            CFrame.new(832.25293, 72.4000626, -425.960327, 0.92051065, 1.7209215e-05, 0.390717506, 1.7209215e-05, 1, -8.45891991e-05, -0.390717506, 8.45891991e-05, 0.92051065),
            CFrame.new(1015.09216, 76.4000168, -109.286324, 0.92051065, 1.7209215e-05, 0.390717506, 1.7209215e-05, 1, -8.45891991e-05, -0.390717506, 8.45891991e-05, 0.92051065),
            CFrame.new(2091.15356, 76.4008026, -146.241943, 0.92051065, 1.7209215e-05, 0.390717506, 1.7209215e-05, 1, -8.45891991e-05, -0.390717506, 8.45891991e-05, 0.92051065),
            CFrame.new(2329.08862, 68.399765, -139.32724, 0.92051065, 1.7209215e-05, 0.390717506, 1.7209215e-05, 1, -8.45891991e-05, -0.390717506, 8.45891991e-05, 0.92051065),
            CFrame.new(2551.04932, 51.7590637, -416.734985, 0.92051065, 1.7209215e-05, 0.390717506, 1.7209215e-05, 1, -8.45891991e-05, -0.390717506, 8.45891991e-05, 0.92051065),
            CFrame.new(2684.32715, 93.7540131, -335.893616, 0.92051065, 1.7209215e-05, 0.390717506, 1.7209215e-05, 1, -8.45891991e-05, -0.390717506, 8.45891991e-05, 0.92051065),
            CFrame.new(2715.09546, 168.181351, -366.406494, 0.92051065, 1.7209215e-05, 0.390717506, 1.7209215e-05, 1, -8.45891991e-05, -0.390717506, 8.45891991e-05, 0.92051065),
            CFrame.new(3035.1333, 160.400879, -363.884369, 0.92051065, 1.7209215e-05, 0.390717506, 1.7209215e-05, 1, -8.45891991e-05, -0.390717506, 8.45891991e-05, 0.92051065),
            CFrame.new(3228.98047, 0.40087986, -337.695892, 0.92051065, 1.7209215e-05, 0.390717506, 1.7209215e-05, 1, -8.45891991e-05, -0.390717506, 8.45891991e-05, 0.92051065),
            CFrame.new(3664.52734, 28.3999748, -221.782272, 0.92051065, 1.7209215e-05, 0.390717506, 1.7209215e-05, 1, -8.45891991e-05, -0.390717506, 8.45891991e-05, 0.92051065),
            CFrame.new(3724.6001, 96.4008789, -244.19928, 0.92051065, 1.7209215e-05, 0.390717506, 1.7209215e-05, 1, -8.45891991e-05, -0.390717506, 8.45891991e-05, 0.92051065),
            CFrame.new(3965.06152, 74.1412125, -311.306549, 0.92051065, 1.7209215e-05, 0.390717506, 1.7209215e-05, 1, -8.45891991e-05, -0.390717506, 8.45891991e-05, 0.92051065),
            CFrame.new(4417.87646, 79.87677, -306.287964, 0.998507142, -2.35839707e-06, -0.0546214506, -2.35839707e-06, 1, -8.62898087e-05, 0.0546214506, 8.62898087e-05, 0.998507142),
            CFrame.new(4445.28857, 101.865707, -306.495819, 0.998507142, -2.35839707e-06, -0.0546214506, -2.35839707e-06, 1, -8.62898087e-05, 0.0546214506, 8.62898087e-05, 0.998507142) -- Summit (cp16)
        },
        BasecampCP = CFrame.new(4522.17334, 79.5129013, -278.735657, 0.998507142, -2.35839707e-06, -0.0546214506, -2.35839707e-06, 1, -8.62898087e-05, 0.0546214506, 8.62898087e-05, 0.998507142) -- cp17 (basecamp)
    }

    -- ====================
    -- UTILITY FUNCTIONS
    -- ====================
    local Utils = {}

    function Utils.doJump()
        local char = getCharacter()
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then 
            hum:ChangeState(Enum.HumanoidStateType.Jumping) 
        end
    end

    function Utils.fireTouch(part)
        local hrp = getHRP()
        if hrp and part then
            for i = 1, 3 do
                firetouchinterest(hrp, part, 0)
                task.wait()
                firetouchinterest(hrp, part, 1)
            end
        end
    end

    function Utils.getCheckpointPart(index)
        local model = workspace:FindFirstChild("Checkpoints")
        if model and model:FindFirstChild("cp" .. index) then
            return model["cp" .. index]
        end
        return nil
    end

    function Utils.getSummitPart()
        local model = workspace:FindFirstChild("Checkpoints")
        if model and model:FindFirstChild("cp16") then
            return model.cp16 -- Summit adalah cp16
        end
        return nil
    end

    function Utils.getBasecampPart()
        local model = workspace:FindFirstChild("Checkpoints")
        if model and model:FindFirstChild("cp17") then
            return model.cp17 -- Basecamp adalah cp17
        end
        return nil
    end

    function Utils.resetToBasecamp()
        local hrp = getHRP()
        hrp.CFrame = GameData.BasecampCP
        task.wait(0.2)
        
        local basecampPart = Utils.getBasecampPart()
        if basecampPart then 
            Utils.fireTouch(basecampPart) 
        end
        Utils.doJump()
    end

    function Utils.getTotalSummit()
        local stats = lp:FindFirstChild("leaderstats")
        if stats and stats:FindFirstChild("Summit") then
            return stats.Summit.Value
        end
        return 0
    end

    function Utils.getCurrentCheckpoint()
        local stats = lp:FindFirstChild("leaderstats")
        if stats and stats:FindFirstChild("Checkpoint") then
            return stats.Checkpoint.Value
        end
        return 0
    end

    -- ====================
    -- MOVEMENT MODULES
    -- ====================
    
    -- Fly Module
    local FlyModule = {}
    FlyModule.IsOnMobile = UserInputService.TouchEnabled
    FlyModule.Active = false
    FlyModule.Speed = 1
    
    local CONTROL = {F = 0, B = 0, L = 0, R = 0}
    local flyConnections = {}

    local function getRoot(char)
        return char:FindFirstChild("HumanoidRootPart") or char:WaitForChild("HumanoidRootPart")
    end

    function FlyModule:StartPCFly()
        if self.IsOnMobile then return end
        
        local char = getCharacter()
        local humanoid = char:WaitForChild("Humanoid")
        local T = getRoot(char)

        self.Active = true

        local BG = Instance.new("BodyGyro")
        BG.P = 9e4
        BG.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
        BG.CFrame = T.CFrame
        BG.Parent = T

        local BV = Instance.new("BodyVelocity")
        BV.Velocity = Vector3.new(0, 0, 0)
        BV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        BV.Parent = T

        local keyDown = UserInputService.InputBegan:Connect(function(input, processed)
            if processed then return end
            if input.KeyCode == Enum.KeyCode.W then CONTROL.F = self.Speed end
            if input.KeyCode == Enum.KeyCode.S then CONTROL.B = -self.Speed end
            if input.KeyCode == Enum.KeyCode.A then CONTROL.L = -self.Speed end
            if input.KeyCode == Enum.KeyCode.D then CONTROL.R = self.Speed end
        end)

        local keyUp = UserInputService.InputEnded:Connect(function(input, processed)
            if input.KeyCode == Enum.KeyCode.W then CONTROL.F = 0 end
            if input.KeyCode == Enum.KeyCode.S then CONTROL.B = 0 end
            if input.KeyCode == Enum.KeyCode.A then CONTROL.L = 0 end
            if input.KeyCode == Enum.KeyCode.D then CONTROL.R = 0 end
        end)

        table.insert(flyConnections, keyDown)
        table.insert(flyConnections, keyUp)

        task.spawn(function()
            repeat task.wait()
                local camera = workspace.CurrentCamera
                if humanoid then humanoid.PlatformStand = true end

                local speed = (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0) and 50 or 0

                if speed ~= 0 then
                    BV.Velocity = ((camera.CFrame.LookVector * (CONTROL.F + CONTROL.B)) + 
                        ((camera.CFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B) * 0.2, 0).p) - camera.CFrame.p)) * speed
                else
                    BV.Velocity = Vector3.new(0, 0, 0)
                end

                BG.CFrame = camera.CFrame
            until not self.Active

            CONTROL = {F = 0, B = 0, L = 0, R = 0}
            BG:Destroy()
            BV:Destroy()
            if humanoid then humanoid.PlatformStand = false end
        end)
    end

    function FlyModule:StartMobileFly()
        if not self.IsOnMobile then return end
        
        self.Active = true
        local char = getCharacter()
        local humanoid = char:WaitForChild("Humanoid")
        local root = getRoot(char)
        local camera = workspace.CurrentCamera
        local controlModule = require(lp.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule"))

        local bv = Instance.new("BodyVelocity")
        bv.Name = "MobileFlyBV"
        bv.Parent = root
        bv.MaxForce = Vector3.new(0, 0, 0)
        bv.Velocity = Vector3.new(0, 0, 0)

        local bg = Instance.new("BodyGyro")
        bg.Name = "MobileFlyBG"
        bg.Parent = root
        bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.P = 1000
        bg.D = 50

        local conn = RunService.RenderStepped:Connect(function()
            if self.Active and root and humanoid and root:FindFirstChild("MobileFlyBV") and root:FindFirstChild("MobileFlyBG") then
                bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
                humanoid.PlatformStand = true
                bg.CFrame = camera.CFrame

                local direction = controlModule:GetMoveVector()
                bv.Velocity = (camera.CFrame.LookVector * -direction.Z + camera.CFrame.RightVector * direction.X) * self.Speed * 50
            end
        end)

        table.insert(flyConnections, conn)
    end

    function FlyModule:Stop()
        self.Active = false
        
        for _, conn in pairs(flyConnections) do
            conn:Disconnect()
        end
        flyConnections = {}

        local char = getCharacter()
        if char then
            local root = getRoot(char)
            if root:FindFirstChild("MobileFlyBV") then root.MobileFlyBV:Destroy() end
            if root:FindFirstChild("MobileFlyBG") then root.MobileFlyBG:Destroy() end
            
            local humanoid = char:FindFirstChildOfClass("Humanoid")
            if humanoid then humanoid.PlatformStand = false end
        end

        CONTROL = {F = 0, B = 0, L = 0, R = 0}
    end

    -- WalkSpeed & JumpPower Module
    local MovementModule = {}
    MovementModule.DefaultWS = 16
    MovementModule.DefaultJP = 50
    MovementModule.WalkSpeed = 16
    MovementModule.JumpPower = 50
    MovementModule.BypassActive = false
    
    local wsLoop = nil
    local jpLoop = nil

    function MovementModule:ActivateBypass()
        if self.BypassActive then
            return false, "Bypass sudah aktif!"
        end

        local success, err = pcall(function()
            local mt = getrawmetatable(game)
            local old = mt.__newindex
            setreadonly(mt, false)

            mt.__newindex = newcclosure(function(t, k, v)
                if (t:IsA("Humanoid") and (k == "WalkSpeed" or k == "JumpPower" or k == "JumpHeight")) then
                    return
                end
                return old(t, k, v)
            end)

            setreadonly(mt, true)
        end)

        if success then
            self.BypassActive = true
            return true, "WalkSpeed & JumpPower dilindungi!"
        else
            return false, "Gagal mengaktifkan bypass: " .. tostring(err)
        end
    end

    function MovementModule:SetWalkSpeed(enabled)
        if enabled then
            local hum = getHumanoid()
            if hum then 
                hum.WalkSpeed = self.WalkSpeed 
            end

            wsLoop = RunService.Heartbeat:Connect(function()
                local hum = getHumanoid()
                if hum and hum.WalkSpeed ~= self.WalkSpeed then
                    hum.WalkSpeed = self.WalkSpeed
                end
            end)
        else
            if wsLoop then 
                wsLoop:Disconnect() 
                wsLoop = nil 
            end
            
            local hum = getHumanoid()
            if hum then 
                hum.WalkSpeed = self.DefaultWS 
            end
        end
    end

    function MovementModule:UpdateWalkSpeed(value)
        self.WalkSpeed = value
        local hum = getHumanoid()
        if hum and wsLoop then
            hum.WalkSpeed = value
        end
    end

    function MovementModule:SetJumpPower(enabled)
        if enabled then
            local hum = getHumanoid()
            if hum then
                if hum.UseJumpPower then
                    hum.JumpPower = self.JumpPower
                else
                    hum.JumpHeight = self.JumpPower
                end
            end

            jpLoop = RunService.Heartbeat:Connect(function()
                local hum = getHumanoid()
                if hum then
                    if hum.UseJumpPower and hum.JumpPower ~= self.JumpPower then
                        hum.JumpPower = self.JumpPower
                    elseif not hum.UseJumpPower and hum.JumpHeight ~= self.JumpPower then
                        hum.JumpHeight = self.JumpPower
                    end
                end
            end)
        else
            if jpLoop then 
                jpLoop:Disconnect() 
                jpLoop = nil 
            end
            
            local hum = getHumanoid()
            if hum then
                if hum.UseJumpPower then
                    hum.JumpPower = self.DefaultJP
                else
                    hum.JumpHeight = self.DefaultJP
                end
            end
        end
    end

    function MovementModule:UpdateJumpPower(value)
        self.JumpPower = value
        local hum = getHumanoid()
        if hum and jpLoop then
            if hum.UseJumpPower then
                hum.JumpPower = value
            else
                hum.JumpHeight = value
            end
        end
    end

    -- ====================
    -- AUTO FARM MODULE - MOUNT YNTKTS
    -- ====================
    local AutoFarm = {}
    AutoFarm.Active = false

    function AutoFarm:RunInstant(notifyCallback)
        task.spawn(function()
            while self.Active do
                -- Go through all checkpoints (1-16)
                for i = 1, 16 do
                    if not self.Active then break end
                    
                    local hrp = getHRP()
                    hrp.CFrame = GameData.Checkpoints[i]
                    task.wait(0.2)
                    
                    local cpPart = Utils.getCheckpointPart(i)
                    if cpPart then 
                        Utils.fireTouch(cpPart) 
                    end
                    
                    Utils.doJump()
                    
                    if notifyCallback then
                        if i == 16 then
                            notifyCallback("Summit Reached!", "Total Summits: " .. Utils.getTotalSummit(), 5)
                        else
                            notifyCallback("Checkpoint Progress", "CP " .. i .. "/16", 2)
                        end
                    end
                    
                    task.wait(1.5)
                end

                -- After reaching summit (cp16), go back to basecamp (cp17)
                task.wait(1)
                Utils.resetToBasecamp()
                
                if notifyCallback then
                    notifyCallback("Reset Complete", "Kembali ke basecamp", 3)
                end
                
                task.wait(2)
            end
        end)
    end

    -- ====================
    -- UI SETUP
    -- ====================
    local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
    local Window = Rayfield:CreateWindow({
        Name = "Mount YNTKTS",
        LoadingTitle = "Auto Summit Mount",
        LoadingSubtitle = "by Zull",
        Theme = "Amethyst",
        DisableRayfieldPrompts = false,
        KeySystem = false
    })

    -- ====================
    -- MAIN TAB - MOUNT YNTKTS
    -- ====================
    local Main = Window:CreateTab("Main", nil)
    
    Main:CreateSection("Auto Farm Summit :")
    
    Main:CreateParagraph({
        Title = "Auto Summit Info :",
        Content = "Sebelum Auto Summit wajib reset ke basecamp. Auto Summit akan otomatis farm dari CP1 sampai Summit, lalu kembali ke basecamp  untuk reset. Script akan loop terus sampai toggle dimatikan."
    })

    Main:CreateButton({
        Name = "Reset ke Basecamp",
        Callback = function()
            Utils.resetToBasecamp()
            Rayfield:Notify({
                Title = "Teleport Basecamp",
                Content = "Kembali ke basecamp",
                Duration = 3
            })
        end
    })

    Main:CreateToggle({
        Name = "Auto Summit",
        CurrentValue = false,
        Flag = "AutoSummitInstant",
        Callback = function(Value)
            AutoFarm.Active = Value
            if Value then
                AutoFarm:RunInstant(function(title, content, duration)
                    Rayfield:Notify({
                        Title = title,
                        Content = content,
                        Duration = duration
                    })
                end)
            end
        end
    })

    -- ====================
    -- TOOLS TAB (TIDAK DIUBAH)
    -- ====================
    local Tools = Window:CreateTab("Tools", nil)

    -- Teleport Section
    Tools:CreateSection("Teleport to CP :")
    
    Tools:CreateParagraph({
        Title = "Info :",
        Content = "Teleport ke basecamp akan mereset checkpoint anda."
    })

    Tools:CreateButton({
        Name = "Teleport to Basecamp",
        Callback = function()
            Utils.resetToBasecamp()
            Rayfield:Notify({
                Title = "Teleport",
                Content = "Kembali ke basecamp",
                Duration = 3
            })
        end
    })

    local selectedCP = "Checkpoint 1"

    Tools:CreateDropdown({
        Name = "Pilih Checkpoint",
        Options = {
            "Checkpoint 1", "Checkpoint 2", "Checkpoint 3", "Checkpoint 4", "Checkpoint 5",
            "Checkpoint 6", "Checkpoint 7", "Checkpoint 8", "Checkpoint 9", "Checkpoint 10",
            "Checkpoint 11", "Checkpoint 12", "Checkpoint 13", "Checkpoint 14", "Checkpoint 15",
            "Checkpoint 16 (Summit)"
        },
        CurrentOption = {"Checkpoint 1"},
        MultipleOptions = false,
        Flag = "CPDropdown",
        Callback = function(Option)
            selectedCP = Option[1]
        end
    })

    Tools:CreateButton({
        Name = "Teleport to Checkpoint",
        Callback = function()
            local hrp = getHRP()
            
            if selectedCP == "Checkpoint 16 (Summit)" then
                hrp.CFrame = GameData.Checkpoints[16]
                local part = Utils.getSummitPart()
                if part then Utils.fireTouch(part) end
                Utils.doJump()
                Rayfield:Notify({Title = "Teleport", Content = "Teleport ke Summit (CP16)", Duration = 3})
            else
                local index = tonumber(selectedCP:match("%d+"))
                if index and GameData.Checkpoints[index] then
                    hrp.CFrame = GameData.Checkpoints[index]
                    local part = Utils.getCheckpointPart(index)
                    if part then Utils.fireTouch(part) end
                    Utils.doJump()
                    Rayfield:Notify({Title = "Teleport", Content = "Teleport ke CP " .. index, Duration = 3})
                end
            end
        end
    })

    -- Teleport to Player Section
    Tools:CreateSection("Teleport to Player :")

    local playerList = {}
    local selectedPlayer = nil
    local playerDropdown = nil

    local function getPlayerList()
        local players = {}
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= lp then
                table.insert(players, player.Name)
            end
        end
        return players
    end

    local function refreshPlayerList()
        playerList = getPlayerList()
        if #playerList == 0 then
            playerList = {"No players available"}
            selectedPlayer = nil
        else
            selectedPlayer = playerList[1]
        end
        return playerList
    end

    -- Initialize player list
    refreshPlayerList()

    playerDropdown = Tools:CreateDropdown({
        Name = "Select Player",
        Options = playerList,
        CurrentOption = {playerList[1] or "No players available"},
        MultipleOptions = false,
        Flag = "PlayerDropdown",
        Callback = function(Option)
            selectedPlayer = Option[1]
        end
    })

    Tools:CreateButton({
        Name = "Refresh Player List",
        Callback = function()
            local newPlayerList = refreshPlayerList()
            
            -- Update dropdown options
            if playerDropdown then
                playerDropdown:Refresh(newPlayerList)
            end
            
            Rayfield:Notify({
                Title = "Player List",
                Content = "Found " .. (#newPlayerList == 1 and newPlayerList[1] == "No players available" and "0" or tostring(#newPlayerList)) .. " players",
                Duration = 2
            })
        end
    })

    Tools:CreateButton({
        Name = "Teleport to Player",
        Callback = function()
            if not selectedPlayer or selectedPlayer == "No players available" then
                Rayfield:Notify({
                    Title = "Teleport Failed",
                    Content = "No player selected!",
                    Duration = 3
                })
                return
            end

            local targetPlayer = Players:FindFirstChild(selectedPlayer)
            if not targetPlayer then
                Rayfield:Notify({
                    Title = "Teleport Failed",
                    Content = "Player not found or left the game!",
                    Duration = 3
                })
                return
            end

            local targetChar = targetPlayer.Character
            if not targetChar then
                Rayfield:Notify({
                    Title = "Teleport Failed",
                    Content = "Player character not loaded!",
                    Duration = 3
                })
                return
            end

            local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
            if not targetHRP then
                Rayfield:Notify({
                    Title = "Teleport Failed",
                    Content = "Cannot find player position!",
                    Duration = 3
                })
                return
            end

            local hrp = getHRP()
            hrp.CFrame = targetHRP.CFrame * CFrame.new(0, 0, 3)
            
            Rayfield:Notify({
                Title = "Teleport Success",
                Content = "Teleported to " .. selectedPlayer,
                Duration = 3
            })
        end
    })

    -- Movement Tools Section
    Tools:CreateSection("Movement :")

    Tools:CreateButton({
        Name = "Bypass AntiCheat",
        Callback = function()
            local success, message = MovementModule:ActivateBypass()
            Rayfield:Notify({
                Title = success and "Bypass Activated" or "Bypass",
                Content = message,
                Duration = success and 5 or 3
            })
        end
    })

    Tools:CreateToggle({
        Name = "Custom WalkSpeed",
        CurrentValue = false,
        Flag = "ToggleWS",
        Callback = function(Value)
            MovementModule:SetWalkSpeed(Value)
            Rayfield:Notify({
                Title = "WalkSpeed",
                Content = Value and "WalkSpeed aktif!" or "WalkSpeed default",
                Duration = 2
            })
        end
    })

    Tools:CreateSlider({
        Name = "WalkSpeed Value",
        Range = {16, 300},
        Increment = 1,
        Suffix = " WS",
        CurrentValue = 16,
        Flag = "WSSlider",
        Callback = function(Value)
            MovementModule:UpdateWalkSpeed(Value)
        end
    })

    Tools:CreateToggle({
        Name = "Custom JumpPower",
        CurrentValue = false,
        Flag = "ToggleJP",
        Callback = function(Value)
            MovementModule:SetJumpPower(Value)
            Rayfield:Notify({
                Title = "JumpPower",
                Content = Value and "JumpPower aktif!" or "JumpPower default",
                Duration = 2
            })
        end
    })

    Tools:CreateSlider({
        Name = "JumpPower Value",
        Range = {50, 300},
        Increment = 5,
        Suffix = " JP",
        CurrentValue = 50,
        Flag = "JPSlider",
        Callback = function(Value)
            MovementModule:UpdateJumpPower(Value)
        end
    })

    Tools:CreateButton({
        Name = "Reset to Default Movement",
        Callback = function()
            -- Stop loops
            MovementModule:SetWalkSpeed(false)
            MovementModule:SetJumpPower(false)
            
            -- Reset values
            MovementModule.WalkSpeed = MovementModule.DefaultWS
            MovementModule.JumpPower = MovementModule.DefaultJP
            
            -- Apply defaults
            local hum = getHumanoid()
            if hum then
                hum.WalkSpeed = MovementModule.DefaultWS
                if hum.UseJumpPower then
                    hum.JumpPower = MovementModule.DefaultJP
                else
                    hum.JumpHeight = MovementModule.DefaultJP
                end
            end
            
            Rayfield:Notify({
                Title = "Movement Reset",
                Content = "WalkSpeed dan JumpPower kembali ke default!",
                Duration = 3
            })
        end
    })

    -- Fly Section
    Tools:CreateSection("Fly :")
    
    Tools:CreateParagraph({
        Title = "Fly Controls",
        Content = "PC: WASD to move. Mobile: Use joystick to move."
    })

    Tools:CreateToggle({
        Name = "Normal Fly",
        CurrentValue = false,
        Flag = "ToggleFly",
        Callback = function(Value)
            if Value then
                if FlyModule.IsOnMobile then
                    FlyModule:StartMobileFly()
                else
                    FlyModule:StartPCFly()
                end
                Rayfield:Notify({Title = "Fly Activated", Content = "Fly mode aktif!", Duration = 3})
            else
                FlyModule:Stop()
                Rayfield:Notify({Title = "Fly Deactivated", Content = "Fly mode dimatikan", Duration = 3})
            end
        end
    })
  
  
    Tools:CreateSlider({
        Name = "Fly Speed",
        Range = {0, 100},
        Increment = 1,
        Suffix = " speed",
        CurrentValue = 1,
        Flag = "FlySpeed",
        Callback = function(Value)
            FlyModule.Speed = Value
        end
    })

    -- ====================
    -- MISC TAB - DISESUAIKAN UNTUK MOUNT YNTKTS
    -- ====================
    local Misc = Window:CreateTab("Misc", nil)
    
    
    -- Function to get player info
    local function getPlayerInfo()
        local nickname = lp.Name
        local checkpointValue = Utils.getCurrentCheckpoint()
        local checkpointText = ""
        
        if checkpointValue == 0 then
            checkpointText = "You're at Basecamp"
        elseif checkpointValue == 16 then
            checkpointText = "You're at Summit"
        else
            checkpointText = "You're at Checkpoint " .. checkpointValue
        end
        
        local totalSummit = lp:FindFirstChild("leaderstats") and lp.leaderstats:FindFirstChild("Summit") and tonumber(lp.leaderstats.Summit.Value) or 0
        local rank = lp:FindFirstChild("leaderstats") and lp.leaderstats:FindFirstChild("Rank") and tostring(lp.leaderstats.Rank.Value) or "No Rank"
        
        return string.format(
            "Nickname: %s\nCheckpoint: %s\nTotal Summit: %d\nRank: %s",
            nickname,
            checkpointText,
            totalSummit,
            rank
        )
    end
    
    -- Create paragraph
    local PlayerInfoParagraph = Misc:CreateParagraph({
        Title = "Information Player",
        Content = getPlayerInfo()
    })
    
    -- Update paragraph continuously
    task.spawn(function()
        while task.wait(1) do
            pcall(function()
                PlayerInfoParagraph:Set({
                    Title = "Information Player",
                    Content = getPlayerInfo()
                })
            end)
        end
    end)
    
    -- Listen to value changes for instant updates
    if lp:FindFirstChild("leaderstats") then
        local leaderstats = lp.leaderstats
        
        if leaderstats:FindFirstChild("Checkpoint") then
            leaderstats.Checkpoint.Changed:Connect(function()
                pcall(function()
                    PlayerInfoParagraph:Set({
                        Title = "Information Player",
                        Content = getPlayerInfo()
                    })
                end)
            end)
        end
        
        if leaderstats:FindFirstChild("Summit") then
            leaderstats.Summit.Changed:Connect(function()
                pcall(function()
                    PlayerInfoParagraph:Set({
                        Title = "Information Player",
                        Content = getPlayerInfo()
                    })
                end)
            end)
        end
        
        if leaderstats:FindFirstChild("Rank") then
            leaderstats.Rank.Changed:Connect(function()
                pcall(function()
                    PlayerInfoParagraph:Set({
                        Title = "Information Player",
                        Content = getPlayerInfo()
                    })
                end)
            end)
        end
    end
    
    Misc:CreateSection("created by Zu11")


end
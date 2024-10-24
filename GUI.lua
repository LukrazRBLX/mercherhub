local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Mercher Hub", "GrapeTheme")

local HomeTab = Window:NewTab("Home")
local HomeSection = HomeTab:NewSection("Home")



HomeSection:NewSlider("Walkspeed Slider", "Adjusts walkspeed", 500, 16, function(s)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

HomeSection:NewSlider("Jumppower Slider", "Adjusts jumppower", 500, 50, function(s)
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

HomeSection:NewButton("Reset WS/JP", "Resets walkspeed and jumppower", function()
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
end)

HomeSection:NewToggle("Infinte Jump", "Jump infinitely", function(state)
    if state then
        _G.infinjump = not _G.infinjump

if _G.infinJumpStarted == nil then
	--Ensures this only runs once to save resources
	_G.infinJumpStarted = true

	--The actual infinite jump
	local plr = game:GetService('Players').LocalPlayer
	local m = plr:GetMouse()
	m.KeyDown:connect(function(k)
		if _G.infinjump then
			if k:byte() == 32 then
			humanoid = game:GetService'Players'.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
			humanoid:ChangeState('Jumping')
			wait()
			humanoid:ChangeState('Seated')
			end
		end
	end)
end
    else
        _G.infinjump = not _G.infinjump

if _G.infinJumpStarted == nil then
	--Ensures this only runs once to save resources
	_G.infinJumpStarted = true

	--The actual infinite jump
	local plr = game:GetService('Players').LocalPlayer
	local m = plr:GetMouse()
	m.KeyDown:connect(function(k)
		if _G.infinjump then
			if k:byte() == 32 then
			humanoid = game:GetService'Players'.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
			humanoid:ChangeState('Jumping')
			wait()
			humanoid:ChangeState('Seated')
			end
		end
	end)
end
    end
end)

HomeSection:NewButton("Invisibility FE", "Gives you invisibility", function()
	loadstring(game:HttpGet('https://pastebin.com/raw/3Rnd9rHf'))()
end)

local STab = Window:NewTab("Scripts Tab")
local SSection = STab:NewSection("Scripts")

SSection:NewButton("Infinite Yield", "Executes Infinite Yield Admin Commands", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

SSection:NewButton("UserCreation Chat Bypass", "Executes UserCreation FREEMIUM Chat Bypass", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/1price/usercreation/refs/heads/main/UserCreation.lua", true))()
end)

SSection:NewButton("Nut Hub", "Executes script hub with over 150+ games supported", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/01iq/scripthub/refs/heads/main/solara",true))()
end)

local GamesTab = Window:NewTab("Games")
local PLGSection = GamesTab:NewSection("Prison Life")

PLGSection:NewButton("Prizz Admin", "Executes Prizz Admin Commands (WARNING: OP)", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/elliexmln/PrizzLife/main/pladmin.lua'))()
end)

PLGSection:NewButton("Prison Life Server Crasher", "Crashes Prison Life Servers (WARNING: VERY OP / CAN CAUSE LAG)", function()
	loadstring(game:HttpGet('https://pastefy.app/FEMkHXoE/raw'))()
end)

local NDSGSection = GamesTab:NewSection("Natural Disaster Survival")

NDSGSection:NewButton("TBAO Hub", "Executes TBAO Hub (NDS Scripts)", function()
	loadstring(game:HttpGet("https://rawscripts.net/raw/Natural-Disaster-Survival-Tbao-Hub-16822"))()
end)

NDSGSection:NewButton("Black Hole FE", "Pulls unanchored parts towards you (TOGGLE NOCLIP / FLY)", function()
	--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local Folder = Instance.new("Folder", Workspace)
local Part = Instance.new("Part", Folder)
local Attachment1 = Instance.new("Attachment", Part)
Part.Anchored = true
Part.CanCollide = false
Part.Transparency = 1

if not getgenv().Network then
    getgenv().Network = {
        BaseParts = {},
        Velocity = Vector3.new(14.46262424, 14.46262424, 14.46262424)
    }

    Network.RetainPart = function(Part)
        if typeof(Part) == "Instance" and Part:IsA("BasePart") and Part:IsDescendantOf(Workspace) then
            table.insert(Network.BaseParts, Part)
            Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
            Part.CanCollide = false
        end
    end

    local function EnablePartControl()
        LocalPlayer.ReplicationFocus = Workspace
        RunService.Heartbeat:Connect(function()
            sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
            for _, Part in pairs(Network.BaseParts) do
                if Part:IsDescendantOf(Workspace) then
                    Part.Velocity = Network.Velocity
                end
            end
        end)
    end

    EnablePartControl()
end

local function ForcePart(v)
    if v:IsA("Part") and not v.Anchored and not v.Parent:FindFirstChild("Humanoid") and not v.Parent:FindFirstChild("Head") and v.Name ~= "Handle" then
        for _, x in next, v:GetChildren() do
            if x:IsA("BodyAngularVelocity") or x:IsA("BodyForce") or x:IsA("BodyGyro") or x:IsA("BodyPosition") or x:IsA("BodyThrust") or x:IsA("BodyVelocity") or x:IsA("RocketPropulsion") then
                x:Destroy()
            end
        end
        if v:FindFirstChild("Attachment") then
            v:FindFirstChild("Attachment"):Destroy()
        end
        if v:FindFirstChild("AlignPosition") then
            v:FindFirstChild("AlignPosition"):Destroy()
        end
        if v:FindFirstChild("Torque") then
            v:FindFirstChild("Torque"):Destroy()
        end
        v.CanCollide = false
        local Torque = Instance.new("Torque", v)
        Torque.Torque = Vector3.new(100000, 100000, 100000)
        local AlignPosition = Instance.new("AlignPosition", v)
        local Attachment2 = Instance.new("Attachment", v)
        Torque.Attachment0 = Attachment2
        AlignPosition.MaxForce = 9999999999999999
        AlignPosition.MaxVelocity = math.huge
        AlignPosition.Responsiveness = 200
        AlignPosition.Attachment0 = Attachment2
        AlignPosition.Attachment1 = Attachment1
    end
end

local blackHoleActive = true

local function toggleBlackHole()
    blackHoleActive = not blackHoleActive
    if blackHoleActive then
        for _, v in next, Workspace:GetDescendants() do
            ForcePart(v)
        end

        Workspace.DescendantAdded:Connect(function(v)
            if blackHoleActive then
                ForcePart(v)
            end
        end)

        spawn(function()
            while blackHoleActive and RunService.RenderStepped:Wait() do
                Attachment1.WorldCFrame = humanoidRootPart.CFrame
            end
        end)
    end
end

local function createControlButton()
    local screenGui = Instance.new("ScreenGui")
    local button = Instance.new("TextButton")

    screenGui.Name = "BlackHoleControlGUI"
    screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

    button.Name = "ToggleBlackHoleButton"
    button.Size = UDim2.new(0, 200, 0, 50)
    button.Position = UDim2.new(0.5, -100, 0, 100)
    button.Text = "Desativar Buraco Negro"
    button.Parent = screenGui

    button.MouseButton1Click:Connect(function()
        toggleBlackHole()
        if blackHoleActive then
            button.Text = "Desativar Buraco Negro"
        else
            button.Text = "Ativar Buraco Negro"
        end
    end)
end

createControlButton()
toggleBlackHole()
end)
-- PLEASE DO NOT SKID THE SCRIPT
-- PLEASE DO NOT SKID THE SCRIPT
-- PLEASE DO NOT SKID THE SCRIPT
-- PLEASE DO NOT SKID THE SCRIPT
-- PLEASE DO NOT SKID THE SCRIPT
-- PLEASE DO NOT SKID THE SCRIPT
-- PLEASE DO NOT SKID THE SCRIPT
-- PLEASE DO NOT SKID THE SCRIPT
-- PLEASE DO NOT SKID THE SCRIPT
-- PLEASE DO NOT SKID THE SCRIPT
-- PLEASE DO NOT SKID THE SCRIPT
-- PLEASE DO NOT SKID THE SCRIPT
-- PLEASE DO NOT SKID THE SCRIPT
-- PLEASE DO NOT SKID THE SCRIPT
-- PLEASE DO NOT SKID THE SCRIPT
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local localPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
local ToggleButton = Instance.new("TextButton")
local Frame = Instance.new("Frame")
local NotificationFrame = Instance.new("Frame")
local NotificationText = Instance.new("TextLabel")
local NotificationTitle = Instance.new("TextLabel")

ScreenGui.Name = "ToggleScriptGUI"
ScreenGui.ResetOnSpawn = false -- Prevent GUI from being destroyed on respawn
ScreenGui.Parent = localPlayer:WaitForChild("PlayerGui")

Frame.Name = "MainFrame"
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 60)
Frame.Position = UDim2.new(0, 50, 0, 50)
Frame.Size = UDim2.new(0, 200, 0, 100)
Frame.Active = true
Frame.Draggable = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 16)
UICorner.Parent = Frame

local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(10, 10, 40)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(40, 40, 80))
}
UIGradient.Parent = Frame

ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = Frame
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
ToggleButton.Position = UDim2.new(0.1, 0, 0.3, 0)
ToggleButton.Size = UDim2.new(0.8, 0, 0.4, 0)
ToggleButton.Text = "Resolver: OFF"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.TextSize = 18

local ButtonUICorner = Instance.new("UICorner")
ButtonUICorner.CornerRadius = UDim.new(0, 16)
ButtonUICorner.Parent = ToggleButton

local ButtonUIGradient = Instance.new("UIGradient")
ButtonUIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 150, 255)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 50, 150))
}
ButtonUIGradient.Parent = ToggleButton

-- Notification GUI
NotificationFrame.Name = "NotificationFrame"
NotificationFrame.Parent = ScreenGui
NotificationFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
NotificationFrame.BackgroundTransparency = 0.5
NotificationFrame.Position = UDim2.new(0.5, -100, 0.5, -50)
NotificationFrame.Size = UDim2.new(0, 200, 0, 100)

local NotificationUICorner = Instance.new("UICorner")
NotificationUICorner.CornerRadius = UDim.new(0, 16)
NotificationUICorner.Parent = NotificationFrame

NotificationTitle.Name = "NotificationTitle"
NotificationTitle.Parent = NotificationFrame
NotificationTitle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
NotificationTitle.BackgroundTransparency = 1
NotificationTitle.Size = UDim2.new(1, 0, 0.4, 0)
NotificationTitle.Font = Enum.Font.SourceSansBold
NotificationTitle.Text = "Resolver OP"
NotificationTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
NotificationTitle.TextSize = 24

NotificationText.Name = "NotificationText"
NotificationText.Parent = NotificationFrame
NotificationText.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
NotificationText.BackgroundTransparency = 1
NotificationText.Position = UDim2.new(0, 0, 0.4, 0)
NotificationText.Size = UDim2.new(1, 0, 0.6, 0)
NotificationText.Font = Enum.Font.SourceSans
NotificationText.Text = "Made By @ feliciaxxx"
NotificationText.TextColor3 = Color3.fromRGB(255, 255, 255)
NotificationText.TextSize = 18

wait(5)
NotificationFrame:Destroy()

local scriptEnabled = false
local connection

local function onHeartbeat()
    for _, Target in pairs(Players:GetPlayers()) do
        if Target ~= localPlayer and Target.Character then
            for _, Part in pairs(Target.Character:GetDescendants()) do
                if Part:IsA("BasePart") then
                    Part.Velocity = Target.Character.Humanoid.MoveDirection * 16
                    Part.AssemblyLinearVelocity = Target.Character.Humanoid.MoveDirection * 16
                end
            end
        end
    end
end

ToggleButton.MouseButton1Click:Connect(function()
    scriptEnabled = not scriptEnabled
    if scriptEnabled then
        ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        ToggleButton.Text = "Resolver: ON"
        ButtonUIGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 255, 150)),
            ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 150, 50))
        }
        if not connection then
            connection = RunService.Heartbeat:Connect(onHeartbeat)
        end
    else
        ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
        ToggleButton.Text = "Resolver: OFF"
        ButtonUIGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 150, 255)),
            ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 50, 150))
        }
        if connection then
            connection:Disconnect()
            connection = nil
        end
    end
end)

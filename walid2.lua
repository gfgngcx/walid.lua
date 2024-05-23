local plrs = game:GetService("Players")
local TeamBased = true ; local teambasedswitch = "o"
local presskeytoaim = true; local aimkey = "e"
local raycast = false
 
local espupdatetime = 5; autoesp = false
 
local lockaim = true; local lockangle = 5
 
local Gui = Instance.new("ScreenGui")
local Move = Instance.new("Frame")
local Main = Instance.new("Frame")
local EspStatus = Instance.new("TextLabel")
local st1 = Instance.new("TextLabel")
local st1_2 = Instance.new("TextLabel")
local st1_3 = Instance.new("TextLabel")
local Name = Instance.new("TextLabel")

--Eigenschaften:
Gui.Name = "Gui"
Gui.Parent = plrs.LocalPlayer:WaitForChild("PlayerGui")
 
Move.Name = "Move"
Move.Parent = Gui
Move.BackgroundColor3 = Color3.new(0.545098, 0, 0)
Move.BackgroundTransparency = 1
Move.BorderSizePixel = 0
Move.Draggable = true
Move.Position = UDim2.new(0.005, 0, -0.15, 0)
Move.Size = UDim2.new(0.28141585, 0, 0.0320388414, 0)
 
Main.Name = "Main"
Main.Parent = Move
Main.BackgroundColor3 = Color3.new(1, 1, 1)
Main.Position = UDim2.new(0, -7, 20.9960003, 0)
Main.Size = UDim2.new(1, 0, 5.79699993, 0)
Main.Style = Enum.FrameStyle.RobloxSquare
 
EspStatus.Name = "EspStatus"
EspStatus.Parent = Main
EspStatus.BackgroundColor3 = Color3.new(1, 1, 1)
EspStatus.BackgroundTransparency = 1
EspStatus.Position = UDim2.new(0, 0, 0.300000012, 0)
EspStatus.Size = UDim2.new(1, 0, 0.162, 0)
EspStatus.Font = Enum.Font.ArialBold
EspStatus.Text = "Drücke O, um Team-basierter Modus zu ändern"
EspStatus.TextColor3 = Color3.new(0.6, 0.196078, 0.8)
EspStatus.TextScaled = true
EspStatus.TextWrapped = true
 
st1.Name = "st1"
st1.Parent = Main
st1.BackgroundColor3 = Color3.new(1, 1, 1)
st1.BackgroundTransparency = 1
st1.Position = UDim2.new(0.271787882, 0, 0, 0)
st1.Size = UDim2.new(0.728211343, 0, 0.161862016, 0)
st1.Font = Enum.Font.ArialBold
st1.Text = ""
st1.TextColor3 = Color3.new(0.0784314, 0.541176, 0)
st1.TextScaled = true
st1.TextSize = 14
st1.TextWrapped = true
 
st1_2.Name = "st1"
st1_2.Parent = Main
st1_2.BackgroundColor3 = Color3.new(1, 1, 1)
st1_2.BackgroundTransparency = 1
st1_2.Position = UDim2.new(0, 0, 0.875999987, 0)
st1_2.Size = UDim2.new(0.999999881, 0, 0.161862016, 0)
st1_2.Font = Enum.Font.ArialBold
st1_2.Text = "Drücke E, um auf eine Person im Sichtfeld zu zielen"
st1_2.TextColor3 = Color3.new(0.6, 0.196078, 0.8)
st1_2.TextScaled = true
st1_2.TextWrapped = true
 
st1_3.Name = "st1"
st1_3.Parent = Main
st1_3.BackgroundColor3 = Color3.new(1, 1, 1)
st1_3.BackgroundTransparency = 1
st1_3.Position = UDim2.new(0, 0, 0.54, 0)
st1_3.Size = UDim2.new(1, 0, 0.261999995, 0)
st1_3.Font = Enum.Font.ArialBold
st1_3.Text = "Drücke L, um ESP-Schleife zu aktivieren, und T, um ESP zu aktualisieren"
st1_3.TextColor3 = Color3.new(0.6, 0.196078, 0.8)
st1_3.TextScaled = true
st1_3.TextWrapped = true
 
Name.Name = "Name"
Name.Parent = Move
Name.BackgroundColor3 = Color3.new(0.545098, 0, 0)
Name.BackgroundTransparency = 1
Name.Position = UDim2.new(0, 25, 20.9860001, 0)
Name.Size = UDim2.new(0.838, 0, 1.27999997, 0)
Name.Font = Enum.Font.Arcade
Name.Text = "ARSENAL GUI"
Name.TextColor3 = Color3.new(0.541176, 0.168627, 0.886275)
Name.TextScaled = true
Name.TextSize = 12
Name.TextWrapped = true

-- Skripte:

local plrsforaim = {}

local lplr = game:GetService("Players").LocalPlayer
Move.Draggable = true
Gui.ResetOnSpawn = false
Gui.Name = "Chat"
Gui.DisplayOrder = 999
 
Gui.Parent = plrs.LocalPlayer.PlayerGui

f = {}
local espforlder

f.addesp = function()
    if not espforlder then
        espforlder = Instance.new("Folder")
        espforlder.Parent = game.Workspace.CurrentCamera
    end
    for i, v in pairs(espforlder:GetChildren()) do
        v:Destroy()
    end
    for _, plr in pairs(plrs:GetChildren()) do
        if plr.Character and plr.Character.Humanoid.Health > 0 and plr.Name ~= lplr.Name then
            if TeamBased then
                if plr.Team.Name ~= plrs.LocalPlayer.Team.Name then
                    local e = espforlder:FindFirstChild(plr.Name)
                    if not e then
                        local bill = Instance.new("BillboardGui", espforlder)
                        bill.Name = plr.Name
                        bill.AlwaysOnTop = true
                        bill.Size = UDim2.new(1, 0, 1, 0)
                        bill.Adornee = plr.Character.Head
                        local Frame = Instance.new('Frame', bill)
                        Frame.Active = true
                        Frame.BackgroundColor3 = Color3.new(1, 0, 

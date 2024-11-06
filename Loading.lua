local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

ReplicatedFirst:RemoveDefaultLoadingScreen()

local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui

local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.fromRGB(0, 20, 40)
background.Parent = screenGui

local textLabel = Instance.new("TextLabel")
textLabel.AnchorPoint = Vector2.new(0.5, 0.5)
textLabel.Position = UDim2.new(0.5, 0, 0.4, 0)
textLabel.Size = UDim2.new(0.6, 0, 0.1, 0)
textLabel.BackgroundTransparency = 1
textLabel.Font = Enum.Font.GothamBold
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.Text = "Chargement..."
textLabel.TextSize = 36
textLabel.Parent = screenGui

local loadingBarBackground = Instance.new("Frame")
loadingBarBackground.AnchorPoint = Vector2.new(0.5, 0.5)
loadingBarBackground.Position = UDim2.new(0.5, 0, 0.6, 0)
loadingBarBackground.Size = UDim2.new(0.5, 0, 0.02, 0)
loadingBarBackground.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
loadingBarBackground.Parent = screenGui

local loadingBar = Instance.new("Frame")
loadingBar.Size = UDim2.new(0, 0, 1, 0)
loadingBar.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
loadingBar.Parent = loadingBarBackground

local tweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tween = tweenService:Create(loadingBar, tweenInfo, {Size = UDim2.new(1, 0, 1, 0)})
tween:Play()

task.wait(5)

if not game:IsLoaded() then
	game.Loaded:Wait()
end

local fadeOutTweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local fadeOutTween = tweenService:Create(screenGui, fadeOutTweenInfo, {BackgroundTransparency = 1, TextTransparency = 1})
fadeOutTween:Play()

fadeOutTween.Completed:Connect(function()
	screenGui:Destroy()
end)

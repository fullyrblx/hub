--------------------------- Loader ------------------------------
-- Usable Values
local ver = "unreleased v1.beta06"
local plr = game.Players.LocalPlayer -- Player
local placeID = game.PlaceId -- Current PlaceID
local debug = false -- Debugging (Enables All Games)
local places = { -- All Valid Places
	DEBUG_PLACE = 0, FNB = 7603193259, FleeTheFacility = 893973440,
	StealABrainrot = 109983668079237, BananaEats = 4448566543, Teddy = 5901440255,
	Spider = 5118969548, FTCModernEdition = 85161254499337, BABFT = 537413528,
	TowerOfHell = 1962086868, Mines = 112279762578792, MM2 = 142823291,
	FunkyFriday = 6447798030, Forsaken = 18687417158, ["3008"] = 2768379856,
	GrowAGarden = 126884695634066,
}

local multiplePlaces = {
	--[[,
	Example = {
		placeIDs = {},
		namesIDs = {}
	}
	]]
	SammysSubway = {
		placeIDs = {96783699408734, 89385065950819, 97751205329399},
		namesIDs = {"chap1", "chap2", "chap3"}
	},

	Doors = {
		placeIDs = {6516141723},
		namesIDs = {"lobby"}
	},

	Pressure = {
		placeIDs = {12411473842},
		namesIDs = {"lobby"}
	},

	Rivals = {
		placeIDs = {17625359962},
		namesIDs = {"lobby"}
	},

	InkGame = {
		placeIDs = {99567941238278},
		namesIDs = {"lobby"}
	},

	Apeirophobia = {
		placeIDs = {10277607801},
		namesIDs = {"lobby"}
	},

	DeadRails = {
		placeIDs = {116495829188952},
		namesIDs = {"lobby"}
	},

	NinetyNineNITF = {
		placeIDs = {79546208627805},
		namesIDs = {"lobby"}
	},

	DoorsFanmade = {
		placeIDs = {12635390088},
		namesIDs = {"lobby"}
	},

	DandysWorld = {
		placeIDs = {16116270224},
		namesIDs = {"lobby"}
	},

	DoorsHardcore = {
		placeIDs = {107838858975205, 137519142947486},
		namesIDs = {"lobby", "ingame"}
	},

	Piggy = {
		placeIDs = {4623386862},
		namesIDs = {"book1"}
	},

	GamesHub = {
		placeIDs = {10211521082},
		namesIDs = {"hub"}
	}
}

local pn = ""
local placeName = "[No Detected Game]" -- Current Place Name
local placeDesc = ""

for i,v in pairs(places) do
	if v == placeID then
		placeName = i
		print("Detected Place: "..placeName)
	end
end
for i,v in pairs(multiplePlaces) do
	if table.find(v.placeIDs, placeID) then
		placeName = i.."_"..v.namesIDs[table.find(v.placeIDs, placeID)]
		print("Detected Place: "..placeName)
	end
end

local gui = Instance.new("ScreenGui", plr.PlayerGui)
gui.Name = "FullyHub"..math.random(1,9999999)
gui.ResetOnSpawn = false

local mframe = Instance.new("Frame", gui)
mframe.Visible = false
mframe.AnchorPoint = Vector2.new(0.5,0.5)
mframe.Position = UDim2.new(0.5,0,0.5,0)
mframe.Size = UDim2.new(0,500,0,410)
mframe.BackgroundColor3 = Color3.fromRGB(5,5,5)
mframe.BackgroundTransparency = 0.3

local b = Instance.new("TextButton", gui)
b.AnchorPoint = Vector2.new(0.5,0.5)
b.Position = UDim2.new(0.105,0,0.25,0)
b.Size = UDim2.new(0,200,0,50)
b.BackgroundTransparency = 1
b.TextColor3 = Color3.fromRGB(255,255,255)
b.TextStrokeColor3 = Color3.fromRGB(0,0,0)
b.TextStrokeTransparency = 0.2
b.TextScaled = true
b.Text = "Open/Close"

b.MouseButton1Click:Connect(function()
	mframe.Visible = not mframe.Visible
end)

local ms = Instance.new("ScrollingFrame", mframe)
ms.Name = "ms"
ms.BackgroundTransparency = 1
ms.Position = UDim2.new(0,0,0,0)
ms.Size = UDim2.new(0,500,0,410)

local layout = Instance.new("UIListLayout", ms)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.Padding = UDim.new(0,5)
layout.SortOrder = Enum.SortOrder.LayoutOrder

-- Default Button
local defaultB = Instance.new("TextButton", plr)
defaultB.Visible = false
defaultB.Font = Enum.Font.FredokaOne
defaultB.TextScaled = true
defaultB.Size = UDim2.new(0,250,0,50)
defaultB.BackgroundColor3 = Color3.fromRGB(255,255,255)

-- Default Textbox
local defaultT = Instance.new("TextBox", plr)
defaultT.Visible = false
defaultT.Font = Enum.Font.FredokaOne
defaultT.TextScaled = true
defaultT.Text = ""
defaultT.Size = UDim2.new(0,250,0,50)
defaultT.BackgroundColor3 = Color3.fromRGB(255,255,255)

-- Default Label
local defaultL = Instance.new("TextLabel", plr)
defaultL.Visible = false
defaultL.Font = Enum.Font.FredokaOne
defaultL.TextScaled = true
defaultL.Text = ""
defaultL.Size = UDim2.new(0,500,0,50)
defaultL.TextStrokeColor3 = Color3.fromRGB(5,5,5)
defaultL.TextStrokeTransparency = 0
defaultL.TextColor3 = Color3.fromRGB(255,255,255)
defaultL.BackgroundTransparency = 1

local o = 1

local function newL(n, t)
	local a = defaultL:Clone()
	a.Name = n..o
	a.Text = t
	a.Visible = true
	a.Parent = ms
	a.LayoutOrder = o
	o += 1

	return a
end

local function newT(n, p)
	local a = defaultT:Clone()
	a.Name = n..o
	a.PlaceholderText = p
	a.Visible = true
	a.Parent = ms
	a.LayoutOrder = o
	o += 1

	return a
end

local function newB(n, t)
	local a = defaultB:Clone()
	a.Name = n..o
	a.Text = t
	a.Visible = true
	a.Parent = ms
	a.LayoutOrder = o
	o += 1

	return a
end

local function mes(t, c, s)
	local a = Instance.new("TextLabel", gui)
	a.TextColor3 = c
	a.TextStrokeColor3 = Color3.fromRGB(0,0,0)
	a.TextStrokeTransparency = .2
	a.TextScaled = true
	a.Text = t
	a.AnchorPoint = Vector2.new(0.5,0.5)
	a.Position = UDim2.new(0.5,0,0.850,0)
	a.Size = UDim2.new(0,700,0,50)
	a.BackgroundTransparency = 1
	wait(s)
	a:Destroy()
end

-- End of Loader

newL("welcome", "FULLY HUB ("..ver..")")
newL("note_01", "REMEMBER: Fully Hub is still in BETA VERSION!")
newL("note_02", "Bugs might occurs and more features & game support are coming soon!")

local speed = newT("speed", "WalkSpeed")

speed.FocusLost:Connect(function()
	plr.Character.Humanoid.WalkSpeed = speed.Text
	speed.Text = ""
end)

local plrESP = newB("esp", "PlrESP")

plrESP.MouseButton1Click:Connect(function()
	for i,v in pairs(game.Players:GetChildren()) do
		if v.Character then
			local bbgui = Instance.new("BillboardGui", v.Character.Head)
			bbgui.ResetOnSpawn = false
			bbgui.StudsOffset = Vector3.new(0,3,0)
			bbgui.AlwaysOnTop = true
			bbgui.MaxDistance = 2000
			bbgui.Enabled = true
			bbgui.Size = UDim2.new(0,200,0,50)

			local plr = Instance.new("TextLabel", bbgui)
			plr.Text = v.DisplayName.." (@"..v.Name..")"
			plr.BackgroundTransparency = 1
			plr.TextColor3 = Color3.fromRGB(255,255,255)
			plr.TextStrokeTransparency = 0
			plr.Size = UDim2.new(0,200,0,50)
			plr.TextScaled = true
			plr.Font = Enum.Font.FredokaOne

			local highlight = Instance.new("Highlight", v.Character)
			highlight.FillTransparency = .5
			highlight.FillColor = Color3.fromRGB(255,0,0)
			highlight.OutlineColor = Color3.fromRGB(220,0,0)
			highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			highlight.OutlineTransparency = 0
		end
	end
end)

local plrJump = newT("jump", "JumpPower")

plrJump.FocusLost:Connect(function()
	plr.Character.Humanoid.UseJumpPower = true
	plr.Character.Humanoid.JumpPower = plrJump.Text
	plrJump.Text = ""
end)

local suicide = newB("reset", "Reset")

suicide.MouseButton1Click:Connect(function()
	plr.Character.Humanoid.Health = 0
end)

local noWall = newB("nowall", "NoWall")

noWall.MouseButton1Click:Connect(function()
	if noWall.Text == "NoWall" then
		noWall.Text = "Wall"
		for _, p in ipairs(workspace:GetDescendants()) do
			if p:IsA("BasePart") and game.Players:FindFirstChild(p.Parent.Name) == nil then
				p.Transparency = 0.8
				for _, c in ipairs(p:GetDescendants()) do
					c:Destroy()
				end
			end
		end
	else
		noWall.Text = "NoWall"
		for _, p in ipairs(workspace:GetDescendants()) do
			if p:IsA("BasePart") and game.Players:FindFirstChild(p.Parent.Name) == nil then
				p.Transparency = 0
			end
		end
	end
end)

local fullbright = newB("fullbright", "Fullbright")

fullbright.MouseButton1Click:Connect(function()
	game.Lighting.ClockTime = 12
	game.Lighting.Brightness = 3
	game.Lighting.Ambient = Color3.fromRGB(255,255,255)
	game.Lighting.OutdoorAmbient = Color3.fromRGB(255,255,255)
	game.Lighting.GlobalShadows = false
	game.Lighting.FogEnd = 100000
	game.Lighting.FogStart = 0
	mes("this is a test", Color3.fromRGB(255,255,50), 5)
end)

local emergency = newB("emergency", "Emergency")

emergency.MouseButton1Click:Connect(function()
	plr:Kick("Emergency Enabled (Instant Force-Kick)")
end)

local fly = newB("fly", "Fly")

fly.MouseButton1Click:Connect(function()
	if fly.Text == "Fly" then
		fly.Text = "Unfly"

		while fly.Text == "Unfly" do
			wait()
			if plr.Character.Humanoid.Jump then
				local bv = Instance.new("BodyVelocity", plr.Character.HumanoidRootPart)
				bv.Velocity = Vector3.new(0,15,0)

				repeat wait() until plr.Character.Humanoid.Jump
				plr.Character.HumanoidRootPart.BodyVelocity:Destroy()
			end
		end
	else
		fly.Text = "Fly"
		plr.Character.HumanoidRootPart.BodyVelocity:Destroy()
	end
end)

local hidePlr = newB("hideplr", "Hide Players")

hidePlr.MouseButton1Click:Connect(function()
	for _, plr in ipairs(game.Players:GetPlayers()) do
		if plr.Character and plr.Name ~= game.Players.LocalPlayer.Name then
			plr.Character:Destroy()
		end
	end
end)

newL("separator", "")
newL("game_special", "GAME SPECIAL MODS")

-- PIGGY SPECIAL
if placeName == "Piggy_book1" or debug then
	newL("game", "Detected: Piggy")

	local piggyvanisher = newB("piggyvanisher", "Piggy Vanisher")

	piggyvanisher.MouseButton1Click:Connect(function()
		if piggyvanisher.Text == "Piggy Vanisher" then
			workspace.PiggyNPC:Destroy()
			piggyvanisher.Text = "Piggy Vanisher (VANISHED)"
		end
	end)

	local piggyesp = newB("piggyesp", "Piggy ESP")

	piggyesp.MouseButton1Click:Connect(function()
		if piggyesp.Text == "Piggy ESP" then
			piggyesp.Text = "Piggy ESP (Enabled)"
			while wait() do
				for _, piggies in ipairs(workspace.PiggyNPC:GetChildren()) do
					if piggies:FindFirstChild("Highlight") == nil then
						local highlight = Instance.new("Highlight", piggies)
						highlight.FillTransparency = .5
						highlight.FillColor = Color3.fromRGB(255,0,0)
						highlight.OutlineColor = Color3.fromRGB(220,0,0)
						highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
						highlight.OutlineTransparency = 0
					end
				end
			end
		end
	end)

	local itemfinder = newB("itemfinder", "Items Finder")

	itemfinder.MouseButton1Click:Connect(function()
		if itemfinder.Text == "Items Finder" then
			itemfinder.Text = "Items Finder (Enabled)"
			for _, folder in ipairs(workspace:GetChildren()) do
				if folder:IsA("Folder") and folder.Name ~= "GameFolder" and folder.Name ~= "LoadedMap" and folder.Name ~= "PiggyNPC"  then
					folder.Name = "items"

					while wait() do
						for _, item in ipairs(folder:GetChildren()) do
							if item:FindFirstChild("BillboardGui") == nil then
								local bbgui = Instance.new("BillboardGui", item)
								bbgui.ResetOnSpawn = false
								bbgui.StudsOffset = Vector3.new(0,3,0)
								bbgui.AlwaysOnTop = true
								bbgui.MaxDistance = 2000
								bbgui.Enabled = true
								bbgui.Size = UDim2.new(0,200,0,50)

								local plr = Instance.new("TextLabel", bbgui)
								plr.Text = item.Name
								plr.BackgroundTransparency = 1
								plr.TextColor3 = Color3.fromRGB(255,255,255)
								plr.TextStrokeTransparency = 0
								plr.Size = UDim2.new(0,200,0,50)
								plr.TextScaled = true
								plr.Font = Enum.Font.FredokaOne

								local highlight = Instance.new("Highlight", item)
								highlight.FillTransparency = .5
								highlight.FillColor = Color3.fromRGB(0,255,0)
								highlight.OutlineColor = Color3.fromRGB(0,220,0)
								highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
								highlight.OutlineTransparency = 0
							end
						end
					end
				end
			end
		end
	end)
end

if placeName == "Doors_lobby" then
	newL("gamedetected", "Game Detected: Doors")
	newL("gameinfo", "In: Lobby")

	local randomElevator = newB("randomElevator", "Join Random Elevator")
	randomElevator.MouseButton1Click:Connect(function()
		game.ReplicatedStorage.RemotesFolder.ElevatorJoin:FireServer(workspace.Lobby.LobbyElevators["LobbyElevator-"..math.random(20,27)])
	end)

	local elevatorExit = newB("elevatorExit", "Elevator Exit")
	elevatorExit.MouseButton1Click:Connect(function()
		game.ReplicatedStorage.RemotesFolder.ElevatorExit:FireServer()
	end)
end

if placeName == "DoorsHardcore_lobby" then

elseif string.sub(placeName, 1, 13) == "DoorsHardcore" then
	newL("gamedetected", "Game Detected: Doors Hardcore")
	newL("gameinfo", "In: GAME")
	local keyESP = newB("keyESP", "Key ESP")
	keyESP.MouseButton1Click:Connect(function()
		if keyESP.Text == "Key ESP" then
			keyESP.Text = "Key ESP (Enabled)"
			while wait() do
				for _, room in ipairs(workspace.CurrentRooms:GetChildren()) do
					if room:FindFirstChild("Assets") and room.Assets:FindFirstChild("KeyObtain") and not room.Assets:FindFirstChild("KeyObtain"):FindFirstChild("Highlight") then
						local hl = Instance.new("Highlight", room.Assets:FindFirstChild("KeyObtain"))
						hl.FillTransparency = .5
						hl.FillColor = Color3.fromRGB(255,0,0)
						hl.OutlineTransparency = 0
						hl.OutlineColor = Color3.fromRGB(200,0,0)
						hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
					end
				end
			end
		end
	end)
end

ms.CanvasSize = UDim2.new(0, 0, 50, 0)

--- This code is uploaded for patching/sharing purposes and is not intended to encourage exploiting.
-- Source: https://v3rmillion.net/showthread.php?tid=1068339&highlight=651474220

local pos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position

function tp(x,y,z)
	-- SETTINGS START
	local valtomove = 30
	noclip = true
	anchored = true
	-- SETTINGS END


	moving = true
	if x < game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X then
		while x < game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X do
			wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X-valtomove,game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y,game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z))
		end
	end
	if z < game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z then
		while z < game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z do
			wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X,game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y,game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z-valtomove))
		end
	end
	if x > game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X then
		while x > game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X do
			wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X+valtomove,game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y,game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z))
		end
	end
	if z > game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z then
		while z > game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z do
			wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X,game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y,game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z+valtomove))
		end
	end
	if y < game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y then
		while y < game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y do
			wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X,game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y-valtomove,game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z))
		end
	end
	if y > game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y then
		while y > game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y do
			wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X,game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y+valtomove,game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z))
		end
	end
	moving = false
	game.Players.LocalPlayer.Character:MoveTo(Vector3.new(x,y,z))
	if anchored == true then
		game.Players.LocalPlayer.Character.Head.Anchored = false
	end
end

tp(workspace["Internal Zones"]["LCZ"]["CC 005"]["SCP-005"].Stand.Position.X,workspace["Internal Zones"]["LCZ"]["CC 005"]["SCP-005"].Stand.Position.Y,workspace["Internal Zones"]["LCZ"]["CC 005"]["SCP-005"].Stand.Position.Z)
wait(5)
tp(pos.X,pos.Y,pos.Z)

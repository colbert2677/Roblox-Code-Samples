--- Example superclass for inheritance example. Intended for OOP.
-- Uses the game/place relationship to be easier to understand.
-- @classmod Game
-- @author colbert2677

local Game = {}
Game.ClassName = "Game"
Game.__index = Game

function Game:__tostring()
	return self.ClassName
end

function Game.new(gameId)
	local self = setmetatable({
			GameId = gameId
		}, Game)
	
	return self
end

return Game

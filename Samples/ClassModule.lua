--- Sample OOP class for Lua
-- @author colbert2677

local Class = {}
Class.ClassName = "Class"
Class.__index = Class

--- Can be written in any number of ways: must follow this eventual pattern.
function Class.new()
	local self = setmetatable({}, Class)
	
	return self
end

function Class:Destroy()
	setmetatable(self, nil)
end

return Class

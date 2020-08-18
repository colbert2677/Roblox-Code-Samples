--- Example subclass for inheritance example. Intended for OOP.
-- Would rather not be asked why Human is a subclass of Animal. Go along with it.
-- @classmod Human
-- @author colbert2677

local Human = setmetatable({}, Animal)
Human.ClassName = "Human"
Human.__index = Human

function Human:__tostring()
	return self.ClassName
end

--- Gender should probably be a property of Animal instead, but...
function Human.new(name, gender)
	local self = setmetatable({
			Name = name,
			Gender = gender
		}, Human)
	
	return self
end

return Gender

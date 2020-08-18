--- Example superclass for inheritance example. Intended for OOP.
-- @classmod Animal
-- @author colbert2677

local Animal = {}
Animal.ClassName = "Animal"
Animal.__index = Animal

function Animal:__tostring()
	return self.ClassName
end

function Animal.new(species, name)
	local self = setmetatable({
			Species = species,
			Name = name,
		}, Animal)
	
	return self
end

return Animal

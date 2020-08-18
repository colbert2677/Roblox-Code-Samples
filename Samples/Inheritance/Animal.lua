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

--- Unnecessary black magic spell only for demonstration's sake.
-- Please just directly set properties. Don't take after this example.
function Animal:ChangeSpecies(toSpecies)
	local fromSpecies = self.Species
	self.Species = toSpecies
	
	print(self.Name .. " became a " .. toSpecies .. " from a " .. fromSpecies .. "!")
end

function Animal:Destroy()
	-- Must lose references afterward
	setmetatable(self, nil)
end

return Animal

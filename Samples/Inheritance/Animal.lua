--- Example superclass for inheritance example. Intended for OOP.
-- @classmod Animal
-- @author colbert2677

local Animal = {}
Animal.ClassName = "Animal"
Animal.__index = Animal

function Animal:__tostring()
	return self.ClassName
end

function Animal.new(name, species)
	local self = setmetatable({
			Species = species,
			Name = name,
		}, Animal)
	
	return self
end

--- Only for demonstration's sake. Please just directly set properties. Don't take after this example.
function Animal:ChangeName(newName)
	local oldName = self.Name
	self.Name = newName
	
	print(self.Name .. " changed their name from " .. oldName .. "!")
end

function Animal:Destroy()
	-- Must lose references afterward
	setmetatable(self, nil)
end

return Animal

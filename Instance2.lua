--[[
	@ Instance2
	@ colbert2677
	
	# Library for improved instancing of objects.
--]]

local Instance2 = {}

-- Classic Instance.new with better support for parent argument
function Instance2.new(className, parent)
	local object = Instance.new(className)
	
	if parent then
		object.Parent = parent
	end
	
	return object
end

-- Pass table of properties to be set, defer setting of parent
function Instance2.create(className, properties)
	local object = Instance.new(className)
	local parent = properties.Parent or nil
	
	for property, value in pairs(properties) do
		if not property == "Parent" then
			object[property] = value
		end
	end
	
	if parent then
		object.Parent = parent
	end
	
	return object
end

return Instance2

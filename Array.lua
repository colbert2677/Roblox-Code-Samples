--[[
	@ Array
	@ colbert2677
	
	Utilities for array-based coding. Does not work with dictionaries.
--]]

local Array = {}

function Array.SelectRandom(array)
	if #array == 1 then
		return array[1]
	end
	
	local position = Random.new():NextInteger(1, #array)
	
	return array[position]
end

return Array

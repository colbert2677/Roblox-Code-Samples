--[[
	@ TableUtility
	@ colbert2677
	@ April 3, 2020
	
	Utilities for working with tables.
--]]

local TableUtility = {}

function TableUtility.ArraySelectRandom(array)
	if #array == 1 then
		return array[1]
	end
	
	local position = Random.new():NextInteger(1, #array)
	
	return array[position]
end

function TableUtility.DictionarySelectRandom(dictionary)
	local keys = {}
	
	for key, _ in pairs(dictionary) do
		table.insert(keys, key)
	end
	
	if #keys == 1 then
		local onlyKey = keys[1]
		return dictionary[onlyKey]
	end
	
	local position = Random.new():NextInteger(1, #keys)
	local key = keys[position]
	
	return dictionary[key]
end

return TableUtility

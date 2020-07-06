-- colbert2677 - July 2020
--- Allows scripts to use strings to import modules. Modules must have the "Library" tag
--- in order to be pulled by name, otherwise the import will fail.

local CollectionService = game:GetService("CollectionService")

local LIBRARY_TAG = "Library"

local libraries = {}
local loadedLibraries = {}
local queueLine = {}

local function bindToTag(tag, callback)
	CollectionService:GetInstanceAddedSignal(tag):Connect(callback)
	
	for _, tagged in ipairs(CollectionService:GetTagged(tag)) do
		callback(tagged)
	end
end

local function importLibrary(target)
	if typeof(target) == "string" then
		return loadedLibraries[target]
	elseif typeof(target) == "Instance" then
		return require(target)
	end
end

bindToTag(LIBRARY_TAG, function(target)
	if target:IsA("ModuleScript") then
		libraries[target.Name] = target
	end
	
	CollectionService:RemoveTag(target, LIBRARY_TAG)
end)

setmetatable(loadedLibraries, {
	__index = function(self, index)
		if not libraries[index] then
			error("Attempted to import library that does not exist.", 2)
		end
		
		local module = require(libraries[index])
		rawset(loadedLibraries, index, module)
		return loadedLibraries[index]
	end
})

return importLibrary

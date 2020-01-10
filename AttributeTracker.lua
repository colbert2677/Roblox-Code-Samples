-- OLD UNFINISHED COPY

--[[
	@ AttributeTracker
	@ colbert2677
	~ November 16th, 2019
	
	Temporary alternative to attributes.
--]]

local AttributeTracker = {}
local Methods = {}
local DataEvents = {}

function DataEvents:__newindex(key, value)
	rawset(self, key, value)
	self.events.eAttributeChanged:Fire(key)
end

function Methods:GetAttribute(key)
	return self.data[key]
end

function Methods:GetAttributes()
	return self.data
end

function Methods:SetAttribute(key, value)
	self.data[key] = value
end

function AttributeTracker.new()
	local obj = {
		data = setmetatable({}, DataEvents),
		events = {
			AttributeChanged = Instance.new("BindableEvent")
		}
	}
	
	for eventName, bindableEvent in pairs(obj.events) do
		obj[eventName] = bindableEvent.Event
	end
	
	return setmetatable(obj, Methods)
end

return AttributeTracker

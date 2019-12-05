-- Example of inheritance for OOP-in-Lua

local function tostringMetaFunc(self)
    return self.__superproperty
end

local Super = {}
Super.__index = Super
Super.__tostring = tostringMetaFunc
Super.__superproperty = "Abstract"

local Sub = setmetatable({}, Super)
Sub.__tostring = tostringMetaFunc
Sub.__index = Sub

function Super.new()
    return setmetatable({}, Super)
end

function Sub.new()
    return setmetatable({}, Sub)
end

local SuperObject = Super.new()
local SubObject = Sub.new()

print(SuperObject)
print(SubObject)

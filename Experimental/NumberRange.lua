-- Reproduction of NumberRange class out of boredom
-- TODO: Reorganise

local BAD_TYPE = "bad argument #%i to '%s' (%s expected, got %s)"
local BAD_ARGUMENT = "bad argument #%i to '%s' (%s)"

local NumberRange = {}
NumberRange.__index = NumberRange

function NumberRange.new(min, max)
    -- Argument validation
    assert(min, BAD_TYPE:format(1, "new", "number", "no value"))
    assert(type(min) == "number", BAD_TYPE:format(1, "new", "number", type(min)))
    assert(max, BAD_TYPE:format(2, "new", "number", "no value"))
    assert(type(max) == "number", BAD_TYPE:format(2, "new", "number", type(max)))
    assert(max > min, BAD_ARGUMENT:format(1, "new", "interval empty"))

    local rangeObject = setmetatable({
        Min = min,
        Max = max,
    }, NumberRange)

    return rangeObject
end

function NumberRange:__tostring()
    return "NumberRange" -- TODO: self.ClassName
end

local nums = NumberRange.new(1, 2)
print(nums, nums.Min, nums.Max)

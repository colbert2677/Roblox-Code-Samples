--- Wrap SetCore attempts in a retrying Promise
-- Enforces that SetCore successfully processes request.
-- @module PromiseSetCore
-- @author colbert2677

local StarterGui = game:GetService("StarterGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Promise = require("Promise")

--- Make Promise to use SetCore in
-- @param coreType Core type to call SetCore on
-- @param value Expected future value of core item
-- @return Promise The retried Promise
local function setCore(coreType, value)
	local setCorePromise = Promise.new(function (resolve)
		StarterGui:SetCore(coreType, value)
		
		resolve(StarterGui:GetCore(coreType))
    end)
    
    return Promise.retry(setCorePromise, math.huge, coreType, value):catch(function ()
        warn("PromiseSetCore unexpectedly could not set " .. coreType)
    end)
end

return setCore

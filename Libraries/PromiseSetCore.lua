--- Wrap SetCore attempts in a retrying Promise
-- @module PromiseSetCore
-- @author colbert2677

local StarterGui = game:GetService("StarterGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Promise = require(ReplicatedStorage.Promise)

local MAX_RETRIES = 10

--- Make Promise to use SetCore in
-- @see promiseRetry
local function setCore(coreType, value)
	return Promise.new(function (resolve)
		StarterGui:SetCore(coreType, value)
		
		resolve()
    end):catch(function (e)
        return Promise.delay(1):andThen(function ()
            return Promise.reject(e)
        end)
    end)
end

--- Retry the Promise from SetCore
-- @param coreType Core type to call SetCore on
-- @param value Expected future value of core item
-- @return Promise The retried Promise
local function PromiseSetCore(coreType, value)
	return Promise.retry(setCore, MAX_RETRIES, coreType, value):catch(function ()
		warn("PromiseSetCore could not be resolved")
	end)
end

return PromiseSetCore

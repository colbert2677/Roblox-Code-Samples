--- Wrap SetCore attempts in a retrying Promise
-- @module PromiseSetCore

local StarterGui = game:GetService("StarterGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Promise = require(ReplicatedStorage.Scripts.Modules.Promise)

local MAX_RETRIES = 15

--- Make Promise to use SetCore in
-- @see promiseRetry
local function setCore(coreType, value)
    return Promise.new(function (resolve)
        StarterGui:SetCore(coreType, value)
        
        resolve()
    end)
end

--- Handle unsuccessful Promise resolution
local function promiseRetryRejected()
    warn("PromiseSetCore could not be resolved")
end

--- Retry the Promise from SetCore
-- @param coreType Core type to call SetCore on
-- @param value Expected future value of core item
-- @return Promise The retried Promise
local function promiseRetry(coreType, value)
    return Promise.retry(setCore, MAX_RETRIES, coreType, value):catch(promiseRetryRejected)
end

return promiseRetry

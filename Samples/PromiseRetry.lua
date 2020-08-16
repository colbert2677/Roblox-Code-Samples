--- Example of a retrying Promise.
-- @see Promise https://github.com/evaera/roblox-lua-promise/blob/master/lib/init.lua
-- @see https://discordapp.com/channels/385151591524597761/385151591998816257/744422476791939183

local Promise = require(script.Parent.Promise)

local RETRY_ATTEMPTS = 5
local SUCCEED_AFTER = 4

local fails = 0

--- Create a Promise that eventually resolves
local function wontSucceedImmediately()
	return Promise.new(function (resolve)
		if fails > SUCCEED_AFTER then
			resolve("was good")
		end
		
		fails = fails + 1
		error("unsuccessful iteration")
	end)
end

Promise.retry(wontSucceedImmediately, RETRY_ATTEMPTS):andThen(print):catch(function ()
	warn("not successful")
end)

--- Example of a retrying Promise.
-- @see Promise

local Promise = require(script.Parent.Promise)

local RETRY_ATTEMPTS = 5
local SUCCEED_AFTER = 4

local fails = 0

--- Create a Promise that eventually resolves
local function wontSucceedImmediately()
	return Promise.new(function (resolve, reject)
		local ok, result = pcall(function ()
			if fails < SUCCEED_AFTER then
				error("unsuccessful iteration")
			end
			
			return "successful iteration"
		end)
		
		if ok then
			print("was ok")
			resolve(result)
		else
			warn("was not ok")
			fails = fails + 1
			reject(result)
		end
	end)
end

Promise.retry(wontSucceedImmediately, RETRY_ATTEMPTS):andThen(print):catch(function ()
	warn("not successful")
end)

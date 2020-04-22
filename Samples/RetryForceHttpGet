local function httpGet(URL)
	local success, response
	
	repeat
		success, response = pcall(function ()
			return HttpService:RequestAsync({
				Url = URL,
				Method = "GET",
			})
		end)
		if not success then
			warn("pcall failed, retrying. Error details:"
			.. "\n\t" .. response)
			wait(3)
		elseif not response.Success then
			warn("HTTP GET failed, retrying. Error details:"
				.. "\n\tStatus Code: " .. response.StatusCode
				.. "\n\tStatus Message: " .. response.StatusMessage)
			wait(3)
		end
	until success and response.Success
	
	local success, decodedResponse = pcall(function ()
		return HttpService:JSONDecode(response.Body)
	end)
	
	-- Assume can't parse means just return the raw data
	return (success and decodedResponse) or response.Body
end

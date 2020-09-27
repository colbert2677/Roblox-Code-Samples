--- Swallow chats for shadow banned users.
-- @module SwallowShadowBanChats
-- @author colbert2677

local function Run(ChatService)
	local function ProcessMessage(speakerName, message, channelName)
		-- Get the speaker and the channel they sent a message in
		local speaker = ChatService:GetSpeaker(speakerName)
		local channel = ChatService:GetChannel(channelName)
		
		-- If neither exists, we're safe to continue processing via other methods
		if not speaker or not channel then return false end
		
		-- Check if they are shadow banned
		if speaker.ShadowBanned then
			-- Send the message to themselves
			speaker:SendMessage(message, channelName, speakerName, message.ExtraData)
		end
		
		-- Return the speaker's shadows banned status
		return speaker.ShadowBanned
	end
	
	ChatService:RegisterProcessCommandsFunction("swallow_shadow_ban_chat", ProcessMessage)
end

return Run

-- Author      : khris(chris) Xo-Malfurion (SES)//ALL CUSTOMISATIONS + IMAGES ETC. (SLIMEZ)
--SuperEmotes works in tandem with ReactiveEmotes.
--SuperEmotes allows an in game soundboard through use of custom emotes.
local superframe = SuperEmotesFrame

superframe:Hide()
superframe:SetScale(1)
superframe:SetBackdrop( {
	bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background-Dark", 
	edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
	tile = true,
	tileSize = 16,
	edgeSize = 16, 
	insets = { left = 4, right = 4, top = 4, bottom = 4 }
});

--###Slash command Handler###--
SLASH_SES1, SLASH_SES2 = '/ses', '/superemotes';
local commandlist = {
	 "help", "list" --, "fav", "listfavs", "toggle", "listfunctions", "rand"
}
local helplist = {
	{ "++----------------------------", "++------------------------------++" },
	{ "--", "Invoke SES with '/ses', '/superemotes'" },
    { "--/ses help", "You're here!" },
    --{ "--/ses rand", "Performs a random Emote. NYI" },
	{ "--/ses 'emote'", "Plays the assigned Audio Emote." },
    { "--/ses list", "Lists available Audio emotes." },
	--{ "--/ses fav 'emote' 'customcommand'", "Set an emote to a custom command. NYI" },
	--{ "--/ses listfavs", "Lists favorite emotes. NYI" },
	--{ "--/ses toggle 'function'", "Turns on/off function. NYI" },
	--{ "--/ses listfunctions", "Lists functions. NYI" }
	--{"--/ses opt","Opens options in Interface Panel"}
}
local function handler(msg, editBox) 
		local _, _, cmd, argsString = string.find(msg, "%s?(%w+)%s?(.*)")	--disect the slashcommand call into usable parts
		local args={}														--create args table

		if argsString ~= nil and argsString ~= "" then	--process args into a table
			for word in argsString:gmatch("%S+") do table.insert(args, word) end	  
		end
		if SEScheckCommands(cmd) > 0 then				--check command table for existing command that matches
			--#############COMMANDS BELOW##############--
			---------------------------
			if cmd =='help' then
				for i=1, #helplist do
					if i < 3 then 
						print(helplist[i][1], helplist[i][2])
					else
						print(helplist[i][1], "-", helplist[i][2])
					end
				end					-- Print Helplist to chat
			end
			----------------------------
			if cmd =='list' then						-- Show the audio emote window
				superframe:Show();
			end
			----------------------------

			--#############COMMANDS ABOVE##############--
		else --check if emote command
			local innerTable = SEScheckEmotes(cmd)
			if innerTable > 0 then
				emotemsg = "EMOTE-"..innerTable
				broadcastSES(emotemsg)
				print("Playing Emote.")
				SESPlayEmoteSound(SESEmotesLIB,innerTable)
			end
		end
end

SlashCmdList["SES"] = handler;
function SEScheckCommands(cmd)
       local index = 1;
       while commandlist[index] do
               if ( cmd == commandlist[index] ) then
                       return 1;
               end
               index = index + 1;
       end
       return 0;
end
function SEScheckEmotes(cmd)
		if cmd == nil then return 0 end;
       local index = 1;
       while index <= getn(SESEmotesLIB) do
               if ( cmd == SESEmotesLIB[index][1] ) then
                       return index;
               end
               index = index + 1;
       end
	   -- if not found in emote library return 0
       return 0;
end
--############################--

-- Event watchers
local events =  {};			--watches player events
local SESevents =  {};		--watches SESevents
local AddonEvents =  {};	--watches addon events that trigger SESevents

local EventListener = CreateFrame("FRAME")		--SOLO events
local SESeventListener = CreateFrame("FRAME")	--SHARED events
local SESAddonListener = CreateFrame("FRAME")	--Addon events
--Local Variables
local broadcastEnabled = true;
local debugmode = false;
--#####SOLO EVENTS######
--		SOLO EVENTS	- These are what you do when you trigger a certain event
--######################
local playername = GetUnitName("player");
local servername = GetRealmName("player");
local fullname = playername.."-"..servername:gsub("%s", "");

	------------------------------------
	function events:PLAYER_DEAD(...)		
		local event = "PLAYER_DEAD"
		if debugmode then print(event) end
		--G_SES_RE:QueueEmote("/hi","target")	--call queue emote function in ReactiveEmotes
		do	--Send Emote and Sounds
		local emoteQueueTable = {}
			emoteQueueTable = {"/point","/laugh","/cry"}
			G_SES_RE:QueueEmote(emoteQueueTable[math.random(1, #emoteQueueTable)],"none")
		end --Send Emote and Sounds
		SESPlaySoundFile(SESTriggersLIB.Triggered)
		broadcastSES(event)
	end
	-----------------------TEMPLATE-----------------------------
	--function events:TEMPLATE_TEMP(...)								--SEE BLIZZ API GUIDE FOR ARGs
	--	--if debugmode then print(arg1.." "..playername) end			--necessary in some functions
	--	--if arg1 ~= "player" then return end							--Avoid this event when you yourself do it
	--	local event = "PLAYER_DEAD"										-- The events string to pass to broadcast function
	--	if debugmode then print(event) end
		--do	--Send Emote and Sounds
		--	local emoteQueueTable = {}
		--	emoteQueueTable = {"/point","/laugh","/cry"}
		--	G_SES_RE:QueueEmote(emoteQueueTable[math.random(1, #emoteQueueTable)],"none")	--call queue emote function in ReactiveEmotes
		--end --Send Emote and Sounds
	--	SESPlaySoundFile(SESTriggersLIB.Triggered)						--Play a sound file, random or specific
	--	broadcastSES(event)												--Broadcasts to other players the event
	--end
	---------------------------------------------------------------
--#############LISTENERS SOLO#######################--
	EventListener:SetScript("OnEvent", function(self, event, ...)
		events[event](self, ...); -- call one of the functions above
	end);
	for k, v in pairs(events) do
		EventListener:RegisterEvent(k); -- Register all events for which handlers have been defined
	end
--###############SOLO END###########################--
--################broadcast - broadcast your solo events to others################
function broadcastSES(event)
	if broadcastEnabled ~= true then return end						--if broadcast is turned off don't share
	if IsInGroup() then
			C_ChatInfo.SendAddonMessage("SES6969", event, "RAID");
		else if debugmode then
			C_ChatInfo.SendAddonMessage("SES6969", event, "GUILD");
		end 
	end
end
--########################
--		SHARED EVENTS	-- Your response to solo events that get broadcasted
--########################

if broadcastEnabled == true then
C_ChatInfo.RegisterAddonMessagePrefix("SES6969")	--registers the chat traffic from this addon to be received
local SESsender;
	function AddonEvents:CHAT_MSG_ADDON(prefix, message, channel, sender)
		if prefix ~= "SES6969" then return end	--ignore if not an SES message
		if sender == fullname then return end	--ignore if from yourself
		local msg = SESnamesplit(message)[1]
		local emoteTableLoc= tonumber(SESnamesplit(message)[2])
		if setContains(SESevents,message) == nil and msg ~= "EMOTE" then print("Event not found, and no EMOTE string found. Please report this bug#: 001-No Valid Events") return end	
		if debugmode then 
			print(prefix..", "..message..", "..channel..", "..sender)	--event..", "..prefix..", "..message..", "..channel..", "..sender
			print(fullname)
			print(setContains(SESevents,message))
		end
		SESsender = SESnamesplit(sender)[1]

		if msg ~= "EMOTE" then
		SESevents[message](self); -- call one of the functions
		else
			if SESEmotesLIB[emoteTableLoc] ~= nil then
			SESPlayEmoteSound(SESEmotesLIB,emoteTableLoc) -- call emote sound
			end
		end
	end

		function setContains(SESevents, event)
			return SESevents[event] ~= nil
		end
--#################################
-- RESPONSES TO EVENTS SENT BY OTHERS--------------
	function SESevents:PLAYER_ENTERING_WORLD(...)		-- TODO Fix so this doesn't interrupt casting (summoning stone)
		local event = "PLAYER_ENTERING_WORLD"
		if debugmode then print("SES_"..event) end
		local emoteQueueTable = {}
			emoteQueueTable = {"thanks %N for finally joining the group.","licks %N.","/taunt","/whistle","/greet","/flex"}
		G_SES_RE:QueueEmote(emoteQueueTable[math.random(1, #emoteQueueTable)],SESsender)
	end
	----------------------
	function SESevents:PLAYER_DEAD(...)					-- When another player dies
		local event = "PLAYER_DEAD"
		if debugmode then print("SES_"..event.."called.".." Target is:"..SESsender) end
		local emoteQueueTable = {}
			emoteQueueTable = {
			"/point",
			"/laugh",
			"/cry",
			"teabags %N.",
			"/mourn",
			"/pity",
			"/violin",
			"bumped into %N's dead body. Oops!",
			"yells at %N for sleeping on the job!",
			"asks %N if they've ever tried -\"Not Dying\""}
		G_SES_RE:QueueEmote(emoteQueueTable[math.random(1, #emoteQueueTable)],SESsender)
	end
	------------------------TEMPLATE------------------------------------------
	--function SESevents:TEMPLATE_TEMP(...)												--Use BLIZZ API for event name and args
	--	local event = "PLAYER_DEAD"														--Only used for debugging in this context
	--	if debugmode then print("SES_"..event.."called.".." Target is:"..SESsender) end	--Debugging
	--	local emoteQueueTable = {}														--Create table to hold emote responses
	--		emoteQueueTable = {"/point","/laugh","/cry"}								--put emotes into the emotetable
	--	local random_emote = math.random(1, #emoteQueueTable)							--
	--	G_SES_RE:QueueEmote(emoteQueueTable[math.random(1, #emoteQueueTable)],SESsender)
	--end
	--------------------------------------------------------------------------------
--####Listeners	############

	----register the above events to frame
		SESAddonListener:SetScript("OnEvent", function(self, event, ...)
		AddonEvents[event](self, ...); -- call one of the functions above
		end);
		SESAddonListener:RegisterEvent("CHAT_MSG_ADDON"); -- Register the ADDON CHAT to this frame
		
		for k, v in pairs(SESevents) do
		SESeventListener:RegisterEvent(k); -- Register all events for which handlers have been defined
		end
end
--######SHARED END########

--#############STRING SPLIT FUNCTION FOR SERVER NAMES####################--
function SESnamesplit (name, sep)
        if sep == nil then
                sep = "-"
        end
        local t={}
        for str in string.gmatch(name, "([^"..sep.."]+)") do
                table.insert(t, str)
        end
        return t
end

--#############Play random sound file from Dir####################--
function SESPlaySoundFile(libTable) 
	if libTable == nill then print("There was an error with SES, aborting play.") return end
	PlaySoundFile(libTable[random(1,#libTable)])
end
--#############Play sound file from Dir####################--
function SESPlayEmoteSound(LibraryTable,InnerTable) 
	if LibraryTable == nill then print("There was an error with SES, aborting play.") return end
	if InnerTable == nill then print("There was an error with SES, aborting play.") return end
	-- can make libraryTable a variable so we can have mroe libraries than SESEmotesLIB
	PlaySoundFile(SESEmotesLIB[tonumber(InnerTable)][2])
end

-- IMAGES AND ONSCREEN DISPLAY ETC ADDON -- SLIMEZ --

function getRandomPosition()
    local x = math.random(-UIParent:GetWidth() / 2, UIParent:GetWidth() / 2)
    local y = math.random(-UIParent:GetHeight() / 2, UIParent:GetHeight() / 2)
    return x, y
end




function SEScheckEmotes(cmd)
    if cmd == nil then return 0 end
    local index = 1
    while index <= getn(SESEmotesLIB) do
        if (cmd == SESEmotesLIB[index][1]) then
            -- If the 'sharingan' emote is used, show the image for 2 seconds
        
			if cmd == 'deutschland' then
				local imageFrame = CreateFrame("Frame", nil, UIParent)
				imageFrame:SetSize(256, 256) -- Change this to the size of your image
				imageFrame.texture = imageFrame:CreateTexture(nil, "BACKGROUND")
				imageFrame.texture:SetAllPoints(imageFrame)
				local x, y = getRandomPosition()
                imageFrame:SetPoint("CENTER", UIParent, "CENTER", x, y) -- Change this to position the image where you want it
				imageFrame:Hide() -- Hide the frame by default
			
				imageFrame.texture:SetTexture("Interface/AddOns/SuperEmotesAndSounds/Images/deutschland.blp")
				imageFrame:Show()
				C_Timer.After(1, function() imageFrame:Hide() end)  -- Hide the image after 2 seconds
			end

			if cmd == 'ciciban' then
				local imageFrame = CreateFrame("Frame", nil, UIParent)
				imageFrame:SetSize(256, 256) -- Change this to the size of your image
				imageFrame.texture = imageFrame:CreateTexture(nil, "BACKGROUND")
				imageFrame.texture:SetAllPoints(imageFrame)
				local x, y = getRandomPosition()
                imageFrame:SetPoint("CENTER", UIParent, "CENTER", x, y) -- Change this to position the image where you want it
				imageFrame:Hide() -- Hide the frame by default
			
				imageFrame.texture:SetTexture("Interface/AddOns/SuperEmotesAndSounds/Images/ciciban.blp")
				imageFrame:Show()
				C_Timer.After(3, function() imageFrame:Hide() end)  -- Hide the image after 2 seconds
			end

			
			if cmd == 'ckn1' or cmd == 'ckn2' or cmd == 'ckn3' or cmd == 'ckn4' then
				-- List of images
				local images = {
					"Interface/AddOns/SuperEmotesAndSounds/Images/Pepe/1019-sadge-business.blp",
					"Interface/AddOns/SuperEmotesAndSounds/Images/Pepe/1673-peepo-dab.blp",
					"Interface/AddOns/SuperEmotesAndSounds/Images/Pepe/1685-peepo-chug.blp",
					"Interface/AddOns/SuperEmotesAndSounds/Images/Pepe/1792-peepo-yoda.blp",
					"Interface/AddOns/SuperEmotesAndSounds/Images/Pepe/1983-peepo-hacker.blp",
					"Interface/AddOns/SuperEmotesAndSounds/Images/Pepe/2236-peepo-derp.blp",
					"Interface/AddOns/SuperEmotesAndSounds/Images/Pepe/2236-peepo-rifle.blp",
					"Interface/AddOns/SuperEmotesAndSounds/Images/Pepe/2389-peepo-justright.blp",
					"Interface/AddOns/SuperEmotesAndSounds/Images/Pepe/3082-peepo-twerk.blp",
					"Interface/AddOns/SuperEmotesAndSounds/Images/Pepe/5750-peepo-kek.blp",
					"Interface/AddOns/SuperEmotesAndSounds/Images/Pepe/6133-peepo-flex.blp",
					"Interface/AddOns/SuperEmotesAndSounds/Images/Pepe/6546-peepo-king.blp",
					"Interface/AddOns/SuperEmotesAndSounds/Images/Pepe/6571-peepo-sipspin.blp",
					"Interface/AddOns/SuperEmotesAndSounds/Images/Pepe/6699-peepo-nerd.blp",
					"Interface/AddOns/SuperEmotesAndSounds/Images/Pepe/6772-peepo-cursing.blp",
					"Interface/AddOns/SuperEmotesAndSounds/Images/Pepe/6869-monka-stop.blp",
					"Interface/AddOns/SuperEmotesAndSounds/Images/Pepe/9053-peepo-adidas.blp",
					"Interface/AddOns/SuperEmotesAndSounds/Images/Pepe/9630-peepo-wave.blp",
					-- Add more images as needed
				}
			
				-- Function to get random position
				local function getRandomPosition()
					local x = math.random(-UIParent:GetWidth() / 2, UIParent:GetWidth() / 2)
					local y = math.random(-UIParent:GetHeight() / 2, UIParent:GetHeight() / 2)
					return x, y
				end
			
				-- Function to show an image at a random position
				local function showImage(image)
					local x, y = getRandomPosition()
					
					local imageFrame = CreateFrame("Frame", nil, UIParent)
					imageFrame:SetSize(256, 256) -- Change this to the size of your image
					imageFrame.texture = imageFrame:CreateTexture(nil, "BACKGROUND")
					imageFrame.texture:SetAllPoints(imageFrame)
					imageFrame:SetPoint("CENTER", UIParent, "CENTER", x, y) -- Set the position to the random position
					imageFrame.texture:SetTexture(image)
					imageFrame:Show()
			
					-- Hide the image after 2 seconds
					C_Timer.After(2, function() imageFrame:Hide() end)
				end
			
				-- Show a random image
				local randomIndex = math.random(#images)
				showImage(images[randomIndex])
			end




			if cmd == 'jutsu2' then
				-- Define the images
				local images = {
					"Interface/AddOns/SuperEmotesAndSounds/Images/jutsu2.1.blp",
					"Interface/AddOns/SuperEmotesAndSounds/Images/jutsu2.2.blp",
					"Interface/AddOns/SuperEmotesAndSounds/Images/jutsu2.3.blp",
					"Interface/AddOns/SuperEmotesAndSounds/Images/jutsu2.4.blp",
					"Interface/AddOns/SuperEmotesAndSounds/Images/jutsu2.5.blp",
					-- Add more images as needed
				}
			
				local imageFrames = {}
			
				local function showImage(image, index)
					-- Hide previous frame
					if imageFrames[index-1] then
						imageFrames[index-1]:Hide()
					end
			
					local imageFrame = CreateFrame("Frame", nil, UIParent)
					imageFrame:SetSize(256, 256) -- Change this to the size of your image
					imageFrame.texture = imageFrame:CreateTexture(nil, "BACKGROUND")
					imageFrame.texture:SetAllPoints(imageFrame)
					imageFrame:SetPoint("CENTER", UIParent, "CENTER", 0, UIParent:GetHeight() / 4)
					imageFrame.texture:SetTexture(image)
					imageFrame:Show()
			
					imageFrames[index] = imageFrame
				end
			
				-- Hardcoded function calls for each image
				C_Timer.After(0.4, function() showImage(images[1], 1) end)  -- 0.2 + 0.2
				C_Timer.After(0.6, function() showImage(images[2], 2) end)  -- 0.2 + 0.4
				C_Timer.After(0.8, function() showImage(images[3], 3) end)  -- 0.2 + 0.6
				C_Timer.After(1.0, function() showImage(images[4], 4) end)  -- 0.2 + 0.8
				C_Timer.After(1.2, function() showImage(images[5], 5) end)  -- 0.2 + 1.0
			
				-- Function to hide the last image after 3 seconds
				C_Timer.After(3.2, function()  -- 0.2 + 3.0
					if imageFrames[#images] then
						imageFrames[#images]:Hide()
					end
				end)
				-- Add more function calls for additional images as needed
			end
			
			
			
			

			if cmd == 'sharingan' then
                local imageFrame = CreateFrame("Frame", nil, UIParent)
                imageFrame:SetSize(256, 256) -- Change this to the size of your image
                imageFrame.texture = imageFrame:CreateTexture(nil, "BACKGROUND")
                imageFrame.texture:SetAllPoints(imageFrame)
				imageFrame:SetPoint("CENTER", UIParent, "CENTER", 0, UIParent:GetHeight() / 4)
				imageFrame:Hide() -- Hide the frame by default
            
                imageFrame.texture:SetTexture("Interface/AddOns/SuperEmotesAndSounds/Images/sharingan.blp")
                imageFrame:Show()
                C_Timer.After(1, function() imageFrame:Hide() end)  -- Hide the image after 2 seconds
            end
			
			
			if cmd == 'amaterasu' then
				-- Define the images
				local images = {
					"Interface/AddOns/SuperEmotesAndSounds/Images/amaterasuleft.blp",
					"Interface/AddOns/SuperEmotesAndSounds/Images/amaterasumiddle.blp",
					"Interface/AddOns/SuperEmotesAndSounds/Images/amaterasuright.blp",
					-- Add more images as needed
				}
			
				local imageFrames = {}
			
				local function showImage(image, index)
					local imageFrame = CreateFrame("Frame", nil, UIParent)
					imageFrame:SetSize(256, 256) -- Change this to the size of your image
					imageFrame.texture = imageFrame:CreateTexture(nil, "BACKGROUND")
					imageFrame.texture:SetAllPoints(imageFrame)
			
					-- Set point based on index
					if index == 1 then
						imageFrame:SetPoint("CENTER", UIParent, "CENTER", -256, UIParent:GetHeight() / 4)
					elseif index == 2 then
						imageFrame:SetPoint("CENTER", UIParent, "CENTER", 0, UIParent:GetHeight() / 4)
					elseif index == 3 then
						imageFrame:SetPoint("CENTER", UIParent, "CENTER", 256, UIParent:GetHeight() / 4)
					end
			
					imageFrame.texture:SetTexture(image)
					imageFrame:Show()
			
					imageFrames[index] = imageFrame
				end
			
				-- Function to show all images at the same time after 0.5 seconds
				C_Timer.After(1.5, function()  
					showImage(images[1], 1)
					showImage(images[2], 2)
					showImage(images[3], 3)
				end)
			
				-- Function to hide all images after 0.5 seconds
				C_Timer.After(3, function()  -- 0.5 + 0.5
					for i=1, #imageFrames do
						imageFrames[i]:Hide()
					end
				end)
			end
			
			if cmd == 'poof' then
				local imageFrame = CreateFrame("Frame", nil, UIParent)
				imageFrame:SetSize(256, 256) -- Change this to the size of your image
				imageFrame.texture = imageFrame:CreateTexture(nil, "BACKGROUND")
				imageFrame.texture:SetAllPoints(imageFrame)
				imageFrame:SetPoint("CENTER", UIParent, "CENTER", 0, UIParent:GetHeight() / 4)
				imageFrame:Hide() -- Hide the frame by default
			
				imageFrame.texture:SetTexture("Interface/AddOns/SuperEmotesAndSounds/Images/poof.blp")
			
				-- Show the image after 0.5 seconds
				C_Timer.After(0.5, function() imageFrame:Show() end)
			
				-- Hide the image 1 second after it is shown (1.5 seconds from now)
				C_Timer.After(1.3, function() imageFrame:Hide() end)
			end
			
			if cmd == 'berserk' then
				local imageFrame = CreateFrame("Frame", nil, UIParent)
				imageFrame:SetSize(256, 256) -- Change this to the size of your image
				imageFrame.texture = imageFrame:CreateTexture(nil, "BACKGROUND")
				imageFrame.texture:SetAllPoints(imageFrame)
				imageFrame:SetPoint("CENTER", UIParent, "CENTER", 0, UIParent:GetHeight() / 4)
				imageFrame:Hide() -- Hide the frame by default
			
				imageFrame.texture:SetTexture("Interface/AddOns/SuperEmotesAndSounds/Images/berserk.blp")
			
				-- Show the image after 0.5 seconds
				C_Timer.After(0.01, function() imageFrame:Show() end)
			
				-- Hide the image 1 second after it is shown (1.5 seconds from now)
				C_Timer.After(7.5, function() imageFrame:Hide() end)
			end
			
            return index
        end
        index = index + 1
    end
    -- If not found in the emote library, return 0
    return 0
end


function SetData()
	local players = {}
	for _, player in ipairs(GetActivePlayers()) do
		local ped = GetPlayerPed(player)
		table.insert(players, player)
	end
	local playerId = PlayerId()
	local name = GetPlayerName(playerId)
	local id = GetPlayerServerId(playerId)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), 'FE_THDR_GTAO', "~b~JOLBAK LIFE ROLEPLAY~g~ |~s~ DISCORD:  ~b~discord.gg/??????????~g~ |~r~ ID: "..id.."~g~ | ~y~"..#players.." Players Online")
	players = {}
end

CreateThread(function()
	AddTextEntry("PM_PANE_LEAVE", "~r~Khoruj az~w~ ~o~JOLBAK LIFE RP ❌")
	AddTextEntry("PM_PANE_QUIT", "~r~Khoruj az ~o~FiveM ❌")
	while true do	
		Wait(5000)
		SetData()
		Wait(5000)
	end
end)

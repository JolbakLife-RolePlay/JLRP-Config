local TackleKey = 51 -- Change to a number which can be found here: https://wiki.fivem.net/wiki/Controls -> E
local TackleTime = 2000 -- In milliseconds
local timeToWaitBeforeShakeScreen = 300 -- In miliseconds
local explosionStrength = 0.18
local isLoopActive = false

RegisterNetEvent('JLRP-Config:Tackle:Client:TacklePlayer')
AddEventHandler('JLRP-Config:Tackle:Client:TacklePlayer', function(ForwardVectorX, ForwardVectorY, ForwardVectorZ, Tackler)
	--TriggerEvent('chatMessage', 'World: ', {255, 0, 0}, Tackler .. ' Be shoma tane zad!')
	SetPedToRagdollWithFall(Framework.PlayerData.ped, TackleTime, TackleTime, 0, ForwardVectorX, ForwardVectorY, ForwardVectorZ, 10.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
	Wait(timeToWaitBeforeShakeScreen)
	ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', explosionStrength) -- change this float to increase/decrease camera shake
end)

local function GetPlayers()
    local Players = {}
	
	for _, playerId in ipairs(GetActivePlayers()) do
		table.insert(Players, playerId)
	end

    return Players
end

local function GetTouchedPlayers()
    local TouchedPlayer = {}
    for Key, playerId in ipairs(GetPlayers()) do
		local ped = GetPlayerPed(playerId)
		if ped then
			if IsEntityTouchingEntity(Framework.PlayerData.ped, ped) then
				table.insert(TouchedPlayer, playerId)
			end
		end
    end
    return TouchedPlayer
end

AddEventHandler("onMultipleKeyPress", function(keys)
	if keys["e"] and keys["space"] then
		if isLoopActive then return end
		if not IsPedFatallyInjured(Framework.PlayerData.ped) and not IsPedInAnyVehicle(Framework.PlayerData.ped) then
			isLoopActive = true
			local ForwardVector = GetEntityForwardVector(Framework.PlayerData.ped)
			local Tackled = {}

			SetPedToRagdollWithFall(Framework.PlayerData.ped, TackleTime - 500, TackleTime, 0, ForwardVector, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
			Wait(timeToWaitBeforeShakeScreen)
			ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', explosionStrength) -- change this float to increase/decrease camera shake
			while IsPedRagdoll(Framework.PlayerData.ped) do
				Wait(0)
				for key, id in ipairs(GetTouchedPlayers()) do
					if not Tackled[id] then
						Tackled[id] = true
						TriggerServerEvent('JLRP-Config:Tackle:Server:TacklePlayer', GetPlayerServerId(id), ForwardVector.x, ForwardVector.y, ForwardVector.z, GetPlayerName(PlayerId()))
					end
				end
			end
			isLoopActive = false
		end
	end
end)
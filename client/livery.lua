RegisterCommand('livery', function(source, args)
	
	local Veh = GetVehiclePedIsIn(GetPlayerPed(-1))
	local liveryID = tonumber(args[1])
	
	SetVehicleLivery(Veh, liveryID)
end, false)
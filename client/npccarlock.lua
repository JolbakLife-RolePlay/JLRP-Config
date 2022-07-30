CreateThread(function()
    while true do              
		local vehicle = GetVehiclePedIsTryingToEnter(Framework.PlayerData.ped)
        if DoesEntityExist(vehicle) then
            local ped = GetPedInVehicleSeat(vehicle, -1)
            if pedd then                   
				SetPedCanBeDraggedOut(pedd, false)
			end 
        end   
        Wait(250)	    							
    end
end)
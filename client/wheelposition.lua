local seat = false
local angle = 0.0
local speed = 0.0

AddEventHandler('JLRP-Config:Cache:Client:OnChange', function(Key, Value, AllCache)
	if Key == "Seat" then
		seat = Value
		if seat then
			while seat == -1 do
				if DoesEntityExist(Cache.Vehicle) then
					local tangle = GetVehicleSteeringAngle(Cache.Vehicle)
					if tangle > 10.0 or tangle < -10.0 then
						angle = tangle
					end
					speed = GetEntitySpeed(Cache.Vehicle)
						
					if speed < 0.1 and not GetIsTaskActive(Framework.PlayerData.ped, 151) and not GetIsVehicleEngineRunning(Cache.Vehicle) then
						SetVehicleSteeringAngle(Cache.Vehicle, angle)
					end
				end
				Wait(500)
			end
		else
			angle = 0.0
			speed = 0.0
		end
	end
end)
local washingVehicle = false
local isInVehicle = false
local seat
local function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

RegisterNetEvent('JLRP-Config:CarWash:Client:WashCar', function()
	if exports.ox_inventory:Search('count', 'money') >= Config.DefaultPrice then
		washingVehicle = true
		if lib.progressBar({
			duration = math.random(4000, 8000),
			label = 'Vehicle is being washed ...',
			useWhileDead = false,
			canCancel = true,
			disable = {
				move = true,
				car = true,
				mouse = false,
				combat = true,
			}})
		then
			local PlayerPed = Framework.PlayerData.ped
			local PedVehicle = GetVehiclePedIsIn(PlayerPed)
			SetVehicleDirtLevel(PedVehicle)
			SetVehicleUndriveable(PedVehicle, false)
			WashDecalsFromVehicle(PedVehicle, 1.0)
			TriggerServerEvent('JLRP-Config:CarWash:Server:WashCar')
			washingVehicle = false
		else
			Framework.ShowNotification("Washing canceled...", 'error')
			washingVehicle = false
		end
	else
		Framework.ShowNotification('You don\'t have enough money($'..Config.DefaultPrice..') in your pocket!', 'error')
	end
end)

AddEventHandler('JLRP-Config:Cache:Client:OnChange', function(Key, Value, Cache)
	if Key == "Seat" then
		seat = Value
		if seat then
			while seat == -1 do
				local inRange = false
				local PlayerPed = Framework.PlayerData.ped
				local PlayerPos = GetEntityCoords(PlayerPed)
				local PedVehicle = GetVehiclePedIsIn(PlayerPed)
				local dirtLevel = GetVehicleDirtLevel(PedVehicle)
				for k in pairs(Config.CarWash) do
					local dist = #(PlayerPos - vector3(Config.CarWash[k]["coords"]["x"], Config.CarWash[k]["coords"]["y"], Config.CarWash[k]["coords"]["z"]))
					if dist <= 10 then
						inRange = true
						if dist <= 7.5 then
							if not washingVehicle then
								DrawText3Ds(Config.CarWash[k]["coords"]["x"], Config.CarWash[k]["coords"]["y"], Config.CarWash[k]["coords"]["z"], '~g~E~w~ - Washing car ($'..Config.DefaultPrice..')')
								if IsControlJustPressed(0, 38) then
									if dirtLevel > Config.DirtLevel then
										TriggerEvent('JLRP-Config:CarWash:Client:WashCar')
									else
										Framework.ShowNotification("The vehicle isn't dirty...", 'error')
									end
								end
							else
								DrawText3Ds(Config.CarWash[k]["coords"]["x"], Config.CarWash[k]["coords"]["y"], Config.CarWash[k]["coords"]["z"], 'The car wash is not available ..')
							end
						end
					end
				end
				if not inRange then
					Wait(5000)
				end
				Wait(0)
			end
		end
	end
end)

do
	for k in pairs(Config.CarWash) do
        local carWash = AddBlipForCoord(Config.CarWash[k]["coords"]["x"], Config.CarWash[k]["coords"]["y"], Config.CarWash[k]["coords"]["z"])
        SetBlipSprite (carWash, 100)
        SetBlipDisplay(carWash, 4)
        SetBlipScale  (carWash, 0.75)
        SetBlipAsShortRange(carWash, true)
        SetBlipColour(carWash, 37)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Config.CarWash[k]["label"])
        EndTextCommandSetBlipName(carWash)
    end
end

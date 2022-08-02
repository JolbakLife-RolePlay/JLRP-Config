local disableShuffle = true
local isInVehicle, seat = false, false
local isLoopActive = false
local isHelpShown = false

local function shuffToDriver()
	disableShuffle = false
	SetPedConfigFlag(Framework.PlayerData.ped, 184, false)
	Wait(3000)
	disableShuffle = true
end
local function disableAutoShuff()
	if isLoopActive then return end
	isLoopActive = true
	isHelpShown = false
	while seat == 0 and disableShuffle do
		local ped = Framework.PlayerData.ped
		local vehicle = GetVehiclePedIsIn(ped)
		if IsVehicleSeatFree(vehicle, -1) then
			if not isHelpShown then
				lib.showTextUI("[E] - Switch to driver seat (/shuff)", {
					position = 'right-center', 
					style = {
						backgroundColor = '#020040', 
						color = white, 
						borderColor = '#d90000', 
						borderWidth = 2
					}
				})
				isHelpShown = true
			end
			if GetIsTaskActive(ped, 165) then
				SetPedIntoVehicle(ped, vehicle, 0)
				SetPedConfigFlag(ped, 184, true)
			end
			if IsControlJustPressed(0, 38) then
				lib.hideTextUI()
				shuffToDriver()
				break
			end
		else
			if isHelpShown then
				lib.hideTextUI()
				isHelpShown = false
			end
			Wait(200)
		end
		Wait(0)
	end
	lib.hideTextUI()
	isLoopActive = false
end

AddEventHandler('JLRP-Config:Cache:Client:OnChange', function(Key, Value, AllCache)
	if Key == "Seat" then
		seat = Value
		if seat == 0 then disableAutoShuff() end
	end
end)

RegisterNetEvent('JLRP-Config:Shuff:Client:SeatShuffle', function()
	if seat then
		if seat == 0 then
			shuffToDriver()
		elseif seat == -1 then
			local ped = Framework.PlayerData.ped
			SetPedIntoVehicle(ped, GetVehiclePedIsIn(ped), 0)
		end
	else
		Framework.ShowNotification("You have to be in a vehicle in order to shuffle!", "info")
	end
end)

RegisterCommand(Config.Shuff.Command, function()
    TriggerEvent("JLRP-Config:Shuff:Client:SeatShuffle")
end, false)
TriggerEvent('chat:addSuggestion', '/'..Config.Shuff.Command, Config.Shuff.Description)

RegisterCommand(Config.Seat.Command, function(_, args)
	if seat then
		local seatIndex = table.unpack(args)
		seatIndex = tonumber(seatIndex)
		local ped = Framework.PlayerData.ped
		local vehicle = GetVehiclePedIsIn(ped, false)
		if seatIndex < 1 or seatIndex > GetVehicleModelNumberOfSeats(GetEntityModel(vehicle)) then
			Framework.ShowNotification("Seat \""..seatIndex.."\" is not recognized in your current vehicle!", "error")
		else
			if vehicle ~= nil and vehicle > 0 then
				SetPedIntoVehicle(ped, vehicle, seatIndex - 2)
			end
		end
	else
		Framework.ShowNotification("You have to be in a vehicle in order to change seat!", "info")
	end
end)
TriggerEvent('chat:addSuggestion', '/'..Config.Seat.Command, Config.Seat.Description, {{ name = 'seat', help = Config.Seat.Extra }})
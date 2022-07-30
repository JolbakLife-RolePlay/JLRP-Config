local CruisedSpeed = 0
local vehicleClasses = {
    [0] = true,
    [1] = true,
    [2] = true,
    [3] = true,
    [4] = true,
    [5] = true,
    [6] = true,
    [7] = true,
    [8] = true,
    [9] = true,
    [10] = true,
    [11] = true,
    [12] = true,
    [13] = false,
    [14] = false,
    [15] = false,
    [16] = false,
    [17] = true,
    [18] = true,
    [19] = true,
    [20] = true,
    [21] = false
}

local function IsBrakingOrHandBraking() return IsControlPressed(2, 76) or IsControlJustPressed(2, 72) end
local function IsDriving() return IsPedInAnyVehicle(Framework.PlayerData.ped, false) and not Framework.PlayerData.dead end
local function GetVehicle() return GetVehiclePedIsIn(Framework.PlayerData.ped, false) end
local function IsInVehicle() return GetPedInVehicleSeat(GetVehicle(), -1) end
local function IsDriver() return GetPedInVehicleSeat(GetVehiclePedIsIn(Framework.PlayerData.ped, false), -1) == Framework.PlayerData.ped end
local function GetVehicleSpeed() return GetEntitySpeed(GetVehicle()) end
local function TransformToKm(speed) return math.floor(speed * 3.6 + 0.5) end -- Uncomment me for km/h
local function TransformToMph(speed) return math.floor(speed * 2.2369 + 0.5) end -- Comment me for mp/h

local function DeactivateCruise()
	TriggerEvent('JLRP-Config:Cruise:Client:ToggleCruise', false)
	CruisedSpeed = 0
end

local function TriggerCruiseControl()
    if CruisedSpeed == 0 and IsDriving() then
        if GetVehicleSpeed() > 0 and GetVehicleCurrentGear(GetVehicle()) > 0 then
            CruisedSpeed = GetVehicleSpeed()
            --local CruisedSpeedMph = TransformToMph(CruisedSpeed) -- Comment me for mp/h
            local CruisedSpeedKm = TransformToKm(CruisedSpeed) -- Uncomment me for km/h
            TriggerEvent('JLRP-Config:Cruise:Client:ToggleCruise', true)
			--Framework.ShowNotification("Cruise Activated: " .. CruisedSpeedMph ..  " MP/H") -- Uncomment me for mp/h
			Framework.ShowNotification("Cruise Activated: " .. CruisedSpeedKm ..  " KM/H") -- Uncomment me for km/h
            while CruisedSpeed > 0 and IsInVehicle() == Framework.PlayerData.ped do
                Wait(0)
                if IsBrakingOrHandBraking() or GetVehicleSpeed() < (CruisedSpeed - 1.5) then
					Framework.ShowNotification("Cruise Deactivated!", "error")
                    Wait(2000)
                    break
                end
                if not IsBrakingOrHandBraking() and IsVehicleOnAllWheels(GetVehicle()) and GetVehicleSpeed() < CruisedSpeed then
                    SetVehicleForwardSpeed(GetVehicle(), CruisedSpeed)
                end
            end
			DeactivateCruise()
        end
    end
end

AddEventHandler("onKeyUp", function(key)
	if key == "c" then
		if Cache.Vehicle then
			local vehClass = GetVehicleClass(Cache.Vehicle)
			if IsDriver() then
				if vehicleClasses[vehClass] then
					TriggerCruiseControl()
				else
					Framework.ShowNotification("This vehicle doesn\'t have cruise control!", "error")
				end
			end
		end
	end
end)
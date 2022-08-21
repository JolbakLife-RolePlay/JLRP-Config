local stage = 0
local movingForward = false
local loopIsRunning = false

local vehicle = false

local function ResetStage()
	stage = 0
	ClearPedTasksImmediately(Framework.PlayerData.ped)
	ResetAnimSet()
	SetPedStealthMovement(Framework.PlayerData.ped,0,0)
end

AddEventHandler("onKeyUp", function(key)
	if key == "lcontrol" and not vehicle then
		stage = stage + 1
		
		if stage ~= 0 then
			if stage == 1 then
				-- Crouch stuff
				ClearPedTasks(Framework.PlayerData.ped)
				RequestAnimSet("move_ped_crouched")
				while not HasAnimSetLoaded("move_ped_crouched") do
					Wait(0)
				end
				SetPedMovementClipset(Framework.PlayerData.ped, "move_ped_crouched",1.0)
				SetPedWeaponMovementClipset(Framework.PlayerData.ped, "move_ped_crouched",1.0)
				SetPedStrafeClipset(Framework.PlayerData.ped, "move_ped_crouched_strafing",1.0)
			elseif stage == 2 then
				ClearPedTasks(Framework.PlayerData.ped)
				RequestAnimSet("move_crawl")
				while not HasAnimSetLoaded("move_crawl") do
					Wait(0)
				end
			elseif stage > 2 then
				ResetStage()
			end
			if loopIsRunning then return end
		end
		
		while stage ~= 0 do
			loopIsRunning = true
			if not IsPedSittingInAnyVehicle(Framework.PlayerData.ped) and not IsPedFalling(Framework.PlayerData.ped) and not IsPedSwimming(Framework.PlayerData.ped) and not IsPedSwimmingUnderWater(Framework.PlayerData.ped) then
				
				if stage == 1 then
					if GetEntitySpeed(Framework.PlayerData.ped) > 1.0 then
						SetPedWeaponMovementClipset(Framework.PlayerData.ped, "move_ped_crouched",1.0)
						SetPedStrafeClipset(Framework.PlayerData.ped, "move_ped_crouched_strafing",1.0)
					elseif GetEntitySpeed(Framework.PlayerData.ped) < 1.0 and (GetFollowPedCamViewMode() == 4 or GetFollowVehicleCamViewMode() == 4) then
						ResetPedWeaponMovementClipset(Framework.PlayerData.ped)
						ResetPedStrafeClipset(Framework.PlayerData.ped)
					end
				elseif stage == 2 then
					DisableControlAction(0, 21, true) -- sprint
					DisableControlAction(1, 140, true)
					DisableControlAction(1, 141, true)
					DisableControlAction(1, 142, true)

					if (IsControlPressed(0, 32) and not movingForward) and Config.EnableProne  then
						movingForward = true
						SetPedMoveAnimsBlendOut(Framework.PlayerData.ped)
						local pronepos = GetEntityCoords(Framework.PlayerData.ped)
						TaskPlayAnimAdvanced(Framework.PlayerData.ped, "move_crawl", "onfront_fwd", pronepos.x, pronepos.y, pronepos.z+0.1, 0.0, 0.0, GetEntityHeading(Framework.PlayerData.ped), 100.0, 0.4, 1.0, 7, 2.0, 1, 1)
						Wait(500)
					elseif (not IsControlPressed(0, 32) and movingForward) then
						local pronepos = GetEntityCoords(Framework.PlayerData.ped)
						TaskPlayAnimAdvanced(Framework.PlayerData.ped, "move_crawl", "onfront_fwd", pronepos.x, pronepos.y, pronepos.z+0.1, 0.0, 0.0, GetEntityHeading(Framework.PlayerData.ped), 100.0, 0.4, 1.0, 6, 2.0, 1, 1)
						Wait(500)
						movingForward = false
					end

					if IsControlPressed(0, 34) then
						SetEntityHeading(Framework.PlayerData.ped,GetEntityHeading(Framework.PlayerData.ped) + 1)
					end

					if IsControlPressed(0, 9) then
						SetEntityHeading(Framework.PlayerData.ped,GetEntityHeading(Framework.PlayerData.ped) - 1)
					end
				end
			else
				stage = 0
			end
			Wait(0)
		end
		loopIsRunning = false
	end
end)

local walkSet = "default"

RegisterNetEvent('JLRP-Config:CrouchProne:Client:SetWalkSet', function(clipset)
    walkSet = clipset
end)

function ResetAnimSet()
    local ped = Framework.PlayerData.ped
    if walkSet == "default" then
        ResetPedMovementClipset(ped)
        ResetPedWeaponMovementClipset(ped)
        ResetPedStrafeClipset(ped)
    else
        ResetPedMovementClipset(ped)
        ResetPedWeaponMovementClipset(ped)
        ResetPedStrafeClipset(ped)
        Wait(100)
        RequestWalking(walkSet)
        SetPedMovementClipset(ped, walkSet, 1)
        RemoveAnimSet(walkSet)
    end
end

function RequestWalking(set)
    RequestAnimSet(set)
    while not HasAnimSetLoaded(set) do
        Wait(1)
    end
end

AddEventHandler('JLRP-Config:Cache:Client:OnChange', function(Key, Value, AllCache)
	if Key == 'Vehicle' then
		if Value and stage ~= 0 then ResetStage() end
		vehicle = Value
	else
		return
	end
end)
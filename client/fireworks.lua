local FireworkList = {
    ["proj_xmas_firework"] = {
        "scr_firework_xmas_ring_burst_rgw",
        "scr_firework_xmas_burst_rgw",
        "scr_firework_xmas_repeat_burst_rgw",
        "scr_firework_xmas_spiral_burst_rgw",
        "scr_xmas_firework_sparkle_spawn",
    },
    ["scr_indep_fireworks"] = {
        "scr_indep_firework_sparkle_spawn",
        "scr_indep_firework_starburst",
        "scr_indep_firework_shotburst",
        "scr_indep_firework_trailburst",
        "scr_indep_firework_trailburst_spawn",
        "scr_indep_firework_burst_spawn",
        "scr_indep_firework_trail_spawn",
        "scr_indep_firework_fountain",
    },
    ["proj_indep_firework"] = {
        "scr_indep_firework_grd_burst",
        "scr_indep_launcher_sparkle_spawn",
        "scr_indep_firework_air_burst",
        "proj_indep_flare_trail",
    },
    ["proj_indep_firework_v2"] = {
        "scr_firework_indep_burst_rwb",
        "scr_firework_indep_spiral_burst_rwb",
        "scr_xmas_firework_sparkle_spawn",
        "scr_firework_indep_ring_burst_rwb",
        "scr_xmas_firework_burst_fizzle",
        "scr_firework_indep_repeat_burst_rwb",
    },
}

CreateThread(function()
    local asset = "scr_indep_fireworks"
	Framework.Streaming.RequestNamedPtfxAsset(asset)
	
    local asset2 = "proj_xmas_firework"
    Framework.Streaming.RequestNamedPtfxAsset(asset2)
	
    local asset3 = "proj_indep_firework_v2"
    Framework.Streaming.RequestNamedPtfxAsset(asset3)
	
    local asset4 = "proj_indep_firework"
	Framework.Streaming.RequestNamedPtfxAsset(asset4)
end)

local fireworkPropObject

function UseFirework(prop)	
	if lib.progressBar({
		duration = 3000,
		label = 'Placing object ...',
		useWhileDead = false,
		canCancel = true,
		disable = {
			move = true,
			car = true,
			mouse = false,
			combat = true,
		},
		anim = {
			dict = "anim@narcotics@trash",
			clip = "drop_front",
			flag = 16,
		}})
	then		
		Framework.Game.SpawnObject(prop, GetEntityCoords(Framework.PlayerData.ped), function(obj)
			SetEntityHeading(obj, GetEntityHeading(playerPed))
			PlaceObjectOnGroundProperly(obj)
		end)
		
		StopAnimTask(Framework.PlayerData.ped, "anim@narcotics@trash", "drop_front", 1.0)
		return true
	else
		StopAnimTask(Framework.PlayerData.ped, "anim@narcotics@trash", "drop_front", 1.0)
        Framework.ShowNotification("Canceled..", "error")
		return false
	end
	return false
end

function DrawText3Ds(x, y, z, text)
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

local function DoFireWork(asset, coords, object)
	fireworkPropObject = nil
    local fireworkTime = 10
    local fireworkLoc = {x = coords.x, y = coords.y, z = coords.z}
    CreateThread(function()
		CreateThread(function()
			while fireworkTime > 0 and fireworkLoc ~= nil do
				DrawText3Ds(fireworkLoc.x, fireworkLoc.y, fireworkLoc.z, "Firework over ~r~"..fireworkTime)
				Wait(0)
			end
		end)
		
        while fireworkTime > 0 do
            Wait(1000)
            fireworkTime = fireworkTime - 1
        end
		
        UseParticleFxAssetNextCall("scr_indep_fireworks")
        for _ = 1, math.random(50, 80), 1 do
            local firework = FireworkList[asset][math.random(1, #FireworkList[asset])]
            UseParticleFxAssetNextCall(asset)
            StartNetworkedParticleFxNonLoopedAtCoord(firework, fireworkLoc.x, fireworkLoc.y, fireworkLoc.z + 42.5, 0.0, 0.0, 0.0, math.random() * 1.5 + 1.8, false, false, false, false)
			UseParticleFxAssetNextCall(asset)
            StartNetworkedParticleFxNonLoopedAtCoord(firework, fireworkLoc.x, fireworkLoc.y, fireworkLoc.z + 12.5, 0.0, 0.0, 0.0, math.random() * 1.5 + 1.8, false, false, false, false)
			UseParticleFxAssetNextCall(asset)
            StartNetworkedParticleFxNonLoopedAtCoord(firework, fireworkLoc.x, fireworkLoc.y, fireworkLoc.z + 32.5, 0.0, 0.0, 0.0, math.random() * 1.5 + 1.8, false, false, false, false)
			UseParticleFxAssetNextCall(asset)
            StartNetworkedParticleFxNonLoopedAtCoord(firework, fireworkLoc.x, fireworkLoc.y, fireworkLoc.z + 22.5, 0.0, 0.0, 0.0, math.random() * 1.5 + 1.8, false, false, false, false)
			Wait(math.random()*500)
        end
		fireworkTime = 0
        fireworkLoc = nil
		Framework.Game.DeleteObject(object)
    end)
end

exports('firework1', function(data, slot)
	if UseFirework("ind_prop_firework_01") then
		exports['ox_inventory']:useItem(data, function(cb)
			-- The item has been used, so trigger the effects
			if cb then
				DoFireWork("proj_indep_firework", GetEntityCoords(Framework.PlayerData.ped), fireworkPropObject)
			end
		end)
	end
end)

exports('firework2', function(data, slot)
	if UseFirework("ind_prop_firework_02") then
		exports['ox_inventory']:useItem(data, function(cb)
			-- The item has been used, so trigger the effects
			if cb then
				DoFireWork("proj_indep_firework_v2", GetEntityCoords(Framework.PlayerData.ped))
			end
		end)
	end
end)

exports('firework3', function(data, slot)
	if UseFirework("ind_prop_firework_03") then
		exports['ox_inventory']:useItem(data, function(cb)
			-- The item has been used, so trigger the effects
			if cb then
				DoFireWork("proj_xmas_firework", GetEntityCoords(Framework.PlayerData.ped))
			end
		end)
	end
end)

exports('firework4', function(data, slot)
	if UseFirework("ind_prop_firework_04") then
		exports['ox_inventory']:useItem(data, function(cb)
			-- The item has been used, so trigger the effects
			if cb then
				DoFireWork("scr_indep_fireworks", GetEntityCoords(Framework.PlayerData.ped))
			end
		end)
	end
end)
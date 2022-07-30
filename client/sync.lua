local function SyncMe()
	local ped = Framework.PlayerData.ped
	local xPlayer = GetPlayerPed(-1)
	local x,y,z = table.unpack(GetEntityCoords(ped))
	local zNew = GetGroundZFor_3dCoord(x+.0,y+.0,z+.0,1)
	if IsEntityDead(ped) or IsPedFatallyInjured(ped) then
		FreezeEntityPosition(ped, true)
		ClearPedTasksImmediately(xPlayer)
		Wait(20)
		FreezeEntityPosition(ped, false)
	elseif not IsEntityDead(ped) and z < 0.0 then
		SetEntityCoords(ped, x, y, zNew)
		SetEntityCoords(ped, x, y, z+100.0)
		Framework.ShowNotification('10 Sanie Sabr Konid...', 'info')
		SetEntityInvincible(ped, true)
		Wait(8500)
		SetEntityInvincible(ped, false)
		Framework.ShowNotification('Done', 'success')
	else 
		Framework.ShowNotification('~Dar Hale Hazer Nemishe Az In Command Esefade Koni...', 'error')
	end
end

RegisterCommand('sync', function(source, args)
	SyncMe()
end, false)

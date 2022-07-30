local base64Icon = 'data:image/png;base64,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'

local function EnableAdminDutyHUDElement()
	local HUDElementTpl = '<div style="color:green;><img src="'..base64Icon..'" style="vertical-align:middle;">&nbsp;{{role}}&nbsp;<img src="'..base64Icon..'" style="vertical-align:middle;"></div>'

	if Framework.GetConfig().EnableHud then
		Framework.UI.HUD.RegisterElement('admin_duty', 6, 0, HUDElementTpl, {
			role = Framework.PlayerData.group:gsub("^%l", string.upper)
		})
	end
end

local function DisableAdminDutyHUDElement()
	if Framework.GetConfig().EnableHud then
		Framework.UI.HUD.RemoveElement('admin_duty')
	end
end

local function RefreshHUD()
	DisableAdminDutyHUDElement()
	local admins = Framework.GetConfig().Server.AdminGroups
	for i = 1, #admins, 1 do
		if Framework.PlayerData.group == admins[i] and Framework.PlayerData.admin then
			EnableAdminDutyHUDElement()
			break
		end
	end
end

RegisterNetEvent('JLRP-Framework:adminDuty')
AddEventHandler('JLRP-Framework:adminDuty', function(state)
	Wait(1000) -- mandatory wait : wait for admin state to change on PlayerData table automatically
	RefreshHUD()
end)

RegisterNetEvent('JLRP-Framework:playerLoaded')
AddEventHandler('JLRP-Framework:playerLoaded', function(xPlayer)
	Framework.PlayerData = xPlayer
	Framework.PlayerLoaded = true
	RefreshHUD()
end)

AddEventHandler('onClientResourceStop', function (resourceName)
	if resourceName == GetCurrentResourceName() then
		DisableAdminDutyHUDElement()
	end
end)

AddEventHandler('onClientResourceStop', function (resourceName)
	if resourceName == GetCurrentResourceName() then
		DisableAdminDutyHUDElement()
	end
end)

AddEventHandler('onResourceStop', function(resourceName)
	if resourceName == GetCurrentResourceName() then
		DisableAdminDutyHUDElement()
	end
end)

Framework.PlayerData = Framework.GetPlayerData()
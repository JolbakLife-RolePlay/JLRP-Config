RegisterNetEvent('JLRP-Config:CarWash:Server:WashCar', function()
    local src = source
    local xPlayer = Framework.GetPlayerFromId(src)
	if xPlayer then
		if xPlayer.getAccount('money').money >= Config.DefaultPrice then
			xPlayer.removeAccountMoney('money', Config.DefaultPrice)
		else
			xPlayer.showNotification('You don\'t have enough money($'..Config.DefaultPrice..') in your pocket!', 'error', 2000)
		end
	end
end)
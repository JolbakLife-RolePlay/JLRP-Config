RegisterNetEvent('JLRP-Config:AFK:KickForAFK', function()
	DropPlayer(source, 'You Have Been Kicked For Being AFK')
end)

Framework.RegisterServerCallback('JLRP-Config:Server:GetPermissions', function(source, cb)
    local xPlayer = Framework.GetPlayerFromId(source)
    local group = xPlayer.getGroup()
    cb(group)
end)

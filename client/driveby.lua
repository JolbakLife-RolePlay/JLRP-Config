AddEventHandler('JLRP-Config:Cache:Client:OnChange', function(Key, Value, AllCache)
	if Key == "Seat" then
		if Value == -1 then
			SetPlayerCanDoDriveBy(PlayerId(), false)
		else
			SetPlayerCanDoDriveBy(PlayerId(), true)
		end
	end
end)


Cache = {
	Vehicle = false,
	Seat = false
}

lib.onCache('seat', function(value)
    Cache.Seat = value
	TriggerEvent("JLRP-Config:Cache:Client:OnChange", "Seat", Cache.Seat, Cache)
end)

lib.onCache('vehicle', function(value)
    Cache.Vehicle = value
	TriggerEvent("JLRP-Config:Cache:Client:OnChange", "Vehicle", Cache.Vehicle, Cache)
end)

AddEventHandler('JLRP-Config:Cache:Client:OnChange', function(Key, Value, AllCache)
	--print("Vehicle => "..tostring(Cache.Vehicle))
	--print("Seat    => "..tostring(Cache.Seat))
end)
RegisterServerEvent('JLRP-Config:Tackle:Server:TacklePlayer')
AddEventHandler('JLRP-Config:Tackle:Server:TacklePlayer', function(Tackled, ForwardVectorX, ForwardVectorY, ForwardVectorZ, Tackler)
	TriggerClientEvent("JLRP-Config:Tackle:Client:TacklePlayer", Tackled, ForwardVectorX, ForwardVectorY, ForwardVectorZ, Tackler)
end)

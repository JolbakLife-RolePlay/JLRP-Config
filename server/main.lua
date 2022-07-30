Framework.RegisterServerCallback('JLRP-Config:Server:GetCurrentPlayers', function(source, cb)
    local totalPlayers = 0
    for _ in pairs(Framework.GetPlayers()) do
        totalPlayers = totalPlayers + 1
    end
    cb(totalPlayers)
end)

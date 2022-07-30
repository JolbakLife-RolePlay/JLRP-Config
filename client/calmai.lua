local relationshipTypes = {
	GetHashKey('PLAYER'),
	GetHashKey('CIVMALE'),
	GetHashKey('CIVFEMALE'),
	GetHashKey('GANG_1'),
	GetHashKey('GANG_2'),
	GetHashKey('GANG_9'),
	GetHashKey('GANG_10'),
	GetHashKey('AMBIENT_GANG_LOST'),
	GetHashKey('AMBIENT_GANG_MEXICAN'),
	GetHashKey('AMBIENT_GANG_FAMILY'),
	GetHashKey('AMBIENT_GANG_BALLAS'),
	GetHashKey('AMBIENT_GANG_MARABUNTE'),
	GetHashKey('AMBIENT_GANG_CULT'),
	GetHashKey('AMBIENT_GANG_SALVA'),
	GetHashKey('AMBIENT_GANG_WEICHENG'),
	GetHashKey('AMBIENT_GANG_HILLBILLY'),
	GetHashKey('DEALER'),
	GetHashKey('COP'),
	GetHashKey('PRIVATE_SECURITY'),
	GetHashKey('SECURITY_GUARD'),
	GetHashKey('ARMY'),
	GetHashKey('MEDIC'),
	GetHashKey('FIREMAN'),
	GetHashKey('HATES_PLAYER'),
	GetHashKey('NO_RELATIONSHIP'),
	GetHashKey('SPECIAL'),
	GetHashKey('MISSION2'),
	GetHashKey('MISSION3'),
	GetHashKey('MISSION4'),
	GetHashKey('MISSION5'),
	GetHashKey('MISSION6'),
	GetHashKey('MISSION7'),
	GetHashKey('MISSION8')
}

CreateThread(function()
	local playerHash = GetHashKey('PLAYER')

	for k, groupHash in ipairs(relationshipTypes) do
		SetRelationshipBetweenGroups(1, playerHash, groupHash)
		SetRelationshipBetweenGroups(1, groupHash, playerHash)
	end
end)
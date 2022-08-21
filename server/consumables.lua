local ox_inventory = exports.ox_inventory

exports('orange', function(event, item, inventory, slot, data)
    if event == 'usedItem' then
		if item and item?.name then
			if item?.name == 'orange' then
				return ox_inventory:AddItem(inventory.id, 'orange_peel', 1)
			end
		end
    end
end)

RegisterNetEvent('JLRP-Config:Server:Consumables:PeelSkin:Orange', function(slot)
	local item = ox_inventory:GetSlot(source, slot)
	if item and item?.slot == slot then
		ox_inventory:RemoveItem(source, 'orange', 1, nil, item?.slot)
		ox_inventory:AddItem(source, 'orange_peeled', 1)
		ox_inventory:AddItem(source, 'orange_peel', 1)
	else
		DropPlayer(source, "Possible Cheater!")
	end
end)

exports('apple', function(event, item, inventory, slot, data)
    if event == 'usedItem' then
		if item and item?.name then
			if item?.name == 'apple' then
				return ox_inventory:AddItem(inventory.id, 'apple_peel', 1)
			end
		end
    end
end)

RegisterNetEvent('JLRP-Config:Server:Consumables:PeelSkin:Apple', function(slot)
	local item = ox_inventory:GetSlot(source, slot)
	if item and item?.slot == slot then
		ox_inventory:RemoveItem(source, 'apple', 1, nil, item?.slot)
		ox_inventory:AddItem(source, 'apple_peeled', 1)
		ox_inventory:AddItem(source, 'apple_peel', 1)
	else
		DropPlayer(source, "Possible Cheater!")
	end
end)

exports('banana', function(event, item, inventory, slot, data)
    if event == 'usedItem' then
		if item and item?.name then
			if item?.name == 'banana' then
				return ox_inventory:AddItem(inventory.id, 'banana_peel', 1)
			end
		end
    end
end)

RegisterNetEvent('JLRP-Config:Server:Consumables:PeelSkin:Banana', function(slot)
	local item = ox_inventory:GetSlot(source, slot)
	if item and item?.slot == slot then
		ox_inventory:RemoveItem(source, 'banana', 1, nil, item?.slot)
		ox_inventory:AddItem(source, 'banana_peeled', 1)
		ox_inventory:AddItem(source, 'banana_peel', 1)
	else
		DropPlayer(source, "Possible Cheater!")
	end
end)

exports('water', function(event, item, inventory, slot, data)
    if event == 'usedItem' then
        return ox_inventory:AddItem(inventory.id, 'trash_water', 1)
    end
end)

exports('cola', function(event, item, inventory, slot, data)
    if event == 'usedItem' then
        return ox_inventory:AddItem(inventory.id, 'trash_can', 1)
    end
end)

exports('coffee_small', function(event, item, inventory, slot, data)
    if event == 'usedItem' then
        return ox_inventory:AddItem(inventory.id, 'trash_coffee', 1)
    end
end)

exports('coffee_medium', function(event, item, inventory, slot, data)
    if event == 'usedItem' then
        return ox_inventory:AddItem(inventory.id, 'trash_coffee', 1)
    end
end)

exports('coffee_large', function(event, item, inventory, slot, data)
    if event == 'usedItem' then
        return ox_inventory:AddItem(inventory.id, 'trash_coffee', 1)
    end
end)
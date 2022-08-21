exports('orange', function(data, slot)
	exports['ox_inventory']:useItem(data, function(cb)
		if cb then
			TriggerServerEvent('JLRP-Framework:addThirst', 20.0)
			TriggerServerEvent('JLRP-Framework:addHunger', 10.0)
			TriggerServerEvent('JLRP-Framework:removeStress', 0.5)
		end
	end)
end)

exports('apple', function(data, slot)
	exports['ox_inventory']:useItem(data, function(cb)
		if cb then
			TriggerServerEvent('JLRP-Framework:addThirst', 10.0)
			TriggerServerEvent('JLRP-Framework:addHunger', 20.0)
			TriggerServerEvent('JLRP-Framework:removeStress', 0.5)
		end
	end)
end)

exports('banana', function(data, slot)
	exports['ox_inventory']:useItem(data, function(cb)
		if cb then
			TriggerServerEvent('JLRP-Framework:addThirst', 5.0)
			TriggerServerEvent('JLRP-Framework:addHunger', 25.0)
			TriggerServerEvent('JLRP-Framework:removeStress', 0.5)
		end
	end)
end)

exports('burger', function(data, slot)
	exports['ox_inventory']:useItem(data, function(cb)
		if cb then
			TriggerServerEvent('JLRP-Framework:addThirst', 5.0)
			TriggerServerEvent('JLRP-Framework:addHunger', 40.0)
			TriggerServerEvent('JLRP-Framework:removeStress', 1.0)
		end
	end)
end)

exports('burger_double', function(data, slot)
	exports['ox_inventory']:useItem(data, function(cb)
		if cb then
			TriggerServerEvent('JLRP-Framework:addThirst', 5.0)
			TriggerServerEvent('JLRP-Framework:addHunger', 50.0)
			TriggerServerEvent('JLRP-Framework:removeStress', 1.0)
		end
	end)
end)

exports('burger_triple', function(data, slot)
	exports['ox_inventory']:useItem(data, function(cb)
		if cb then
			TriggerServerEvent('JLRP-Framework:addThirst', 5.0)
			TriggerServerEvent('JLRP-Framework:addHunger', 60.0)
			TriggerServerEvent('JLRP-Framework:removeStress', 1.0)
		end
	end)
end)

exports('water', function(data, slot)
	exports['ox_inventory']:useItem(data, function(cb)
		if cb then
			TriggerServerEvent('JLRP-Framework:addThirst', 30.0)
			TriggerServerEvent('JLRP-Framework:addHunger', 5.0)
			TriggerServerEvent('JLRP-Framework:removeStress', 0.5)
		end
	end)
end)

exports('cola', function(data, slot)
	exports['ox_inventory']:useItem(data, function(cb)
		if cb then
			TriggerServerEvent('JLRP-Framework:addThirst', 20.0)
			TriggerServerEvent('JLRP-Framework:addHunger', 5.0)
			TriggerServerEvent('JLRP-Framework:removeStress', 0.5)
		end
	end)
end)

exports('coffee_small', function(data, slot)
	exports['ox_inventory']:useItem(data, function(cb)
		if cb then
			TriggerServerEvent('JLRP-Framework:addThirst', 20.0)
			TriggerServerEvent('JLRP-Framework:addHunger', 5.0)
			TriggerServerEvent('JLRP-Framework:removeStress', 2.0)
		end
	end)
end)

exports('coffee_medium', function(data, slot)
	exports['ox_inventory']:useItem(data, function(cb)
		if cb then
			TriggerServerEvent('JLRP-Framework:addThirst', 25.0)
			TriggerServerEvent('JLRP-Framework:addHunger', 5.0)
			TriggerServerEvent('JLRP-Framework:removeStress', 2.5)
		end
	end)
end)

exports('coffee_large', function(data, slot)
	exports['ox_inventory']:useItem(data, function(cb)
		if cb then
			TriggerServerEvent('JLRP-Framework:addThirst', 30.0)
			TriggerServerEvent('JLRP-Framework:addHunger', 5.0)
			TriggerServerEvent('JLRP-Framework:removeStress', 3.0)
		end
	end)
end)
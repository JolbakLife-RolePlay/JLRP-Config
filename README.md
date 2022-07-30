# JLRP-Config
For binoculars to work with ox inventory put this in ox_inventory/data/items.lua:
```lua
['binoculars'] = {
		label = 'Binoculars',
		weight = 2000,
		consume = 0,
		client = {
			export = 'JLRP-Config.binoculars',
		}
	},
```

For fireworks to work with ox inventory put this in ox_inventory/data/items.lua:
```lua
['firework1'] = {
		label = '2Brothers',
		weight = 1000,
		consume = 1,
		client = {
			export = 'JLRP-Config.firework1',
		}
	},
	
	['firework2'] = {
		label = 'Poppelers',
		weight = 1000,
		consume = 1,
		client = {
			export = 'JLRP-Config.firework2',
		}
	},
	
	['firework3'] = {
		label = 'WipeOut',
		weight = 1000,
		consume = 1,
		client = {
			export = 'JLRP-Config.firework3',
		}
	},
	
	['firework4'] = {
		label = 'Weeping Willow',
		weight = 1000,
		consume = 1,
		client = {
			export = 'JLRP-Config.firework4',
		}
	},
```

fx_version 'cerulean'
use_fxv2_oal 'yes'
game 'gta5'
lua54 'yes'

name 'JLRP-Config'
author 'Mahan Moulaei'
discord 'Mahan#8183'
description 'JolbakLifeRP Small Resources'

version '0.0'

shared_scripts {
	'@JLRP-Framework/imports.lua',
	'@ox_lib/init.lua',
	'config.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua'
}

client_scripts {
	--'@menuv/menuv.lua', --gives error?!
	'client/*.lua',
	'client/[CayoPericoImprovements]/cayo_perico_entitysets.lua', 	-- Responsible for spawning in heist props in El Rubio's Mansion safe
	'client/[CayoPericoImprovements]/cp_both_islands.lua', 			-- Both Islands visible in game. (ENABLED BY DEFAULT)
}

data_file 'FIVEM_LOVES_YOU_4B38E96CC036038F' 'events.meta'
data_file 'FIVEM_LOVES_YOU_341B23A2F0E0F131' 'popgroups.ymt'

files {
	'events.meta',
	'popgroups.ymt',
	'relationships.dat',
	
	
	'interiorproxies.meta',
	
	--YTYPs
	'stream/**/*.ytyp',
	'stream/*.ytyp',
	
	--YMTs
	'stream/**/*.ymt',
	'stream/*.ymt',
	
	--YMFs
	'stream/**/*.ymf',
	'stream/*.ymf',
	
	--YMAPs
	'stream/**/*.ymap',
	'stream/*.ymap',
	
	--XMLs
	'*.xml',
	
	--CayoPericoImprovements
	'stream/[CayoPericoImprovements]/[ColouredMap]/int3232302352.gfx',
}

data_file 'INTERIOR_PROXY_ORDER_FILE' 'interiorproxies.meta'

--YTYPs
data_file 'DLC_ITYP_REQUEST' 'stream/**/*.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/*.ytyp'

--YMTs
data_file 'SCENARIO_INFO_FILE' 'stream/**/*.ymt'
data_file 'SCENARIO_INFO_FILE' 'stream/*.ymt'

data_file 'SCENARIO_POINTS_PSO_FILE' 'stream/**/*.ymt'
data_file 'SCENARIO_POINTS_PSO_FILE' 'stream/*.ymt'

data_file 'FIVEM_LOVES_YOU_A01627E3E5FC490A' 'stream/**/*.ymt'
data_file 'FIVEM_LOVES_YOU_A01627E3E5FC490A' 'stream/*.ymt'

data_file 'FIVEM_LOVES_YOU_399915A5EEB45A2B' 'stream/**/*.ymt'
data_file 'FIVEM_LOVES_YOU_399915A5EEB45A2B' 'stream/*.ymt'

data_file 'FIVEM_LOVES_YOU_A9E8B9F6EEB35186' 'stream/**/*.ymt'
data_file 'FIVEM_LOVES_YOU_A9E8B9F6EEB35186' 'stream/*.ymt'

data_file 'FIVEM_LOVES_YOU_DB4D236636684A3F' 'stream/**/*.ymt'
data_file 'FIVEM_LOVES_YOU_DB4D236636684A3F' 'stream/*.ymt'

--YMFs
data_file 'DLC_ITYP_REQUEST' 'stream/**/*.ymf'
data_file 'DLC_ITYP_REQUEST' 'stream/*.ymf'

--YMAPs
data_file 'DLC_ITYP_REQUEST' 'stream/**/*.ymap'
data_file 'DLC_ITYP_REQUEST' 'stream/*.ymap'

--XMLs
data_file 'TIMECYCLEMOD_FILE' '*.xml'

data_file 'SCALEFORM_DLC_FILE' 'stream/[CayoPericoImprovements]/[ColouredMap]/int3232302352.gfx'
fx_version 'adamant'

game 'gta5'

name 'Outlaw Alerts'
description 'Alerts police for various infractions'
author 'RavenStroke'
version 'v1.0'


server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server/server.lua',
	'server/config.lua',
}

client_script {
	"client/client.lua",
	'client/config.lua',
}

dependencies {
	'es_extended',
	'esx_policejob'
}

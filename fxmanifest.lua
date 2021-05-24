fx_version 'adamant'

game 'gta5'

client_scripts {
	'client/*.lua'
}
 
server_scripts {
    '@mysql-async/lib/MySQL.lua',
	'server/main.lua'
}

shared_scripts {
    'config.lua'
}

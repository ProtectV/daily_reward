fx_version 'cerulean'
games { 'gta5' }

author 'Marco H. <marco@marco1223.de>'
description 'FiveM daily_reward'
version '1.0.0 Alpha'

client_scripts {
    'client/client.lua',
}

server_script {
    '@mysql-async/lib/MySQL.lua',
    'config.lua'
}
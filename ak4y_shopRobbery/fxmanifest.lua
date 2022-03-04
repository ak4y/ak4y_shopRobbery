fx_version 'cerulean'
game 'gta5'

client_script 'client.lua'
server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server.lua'
} 

ui_page('ui/ui.html')
files {
    'ui/ui.html',
	'ui/numField.js',
	'ui/numField.css',
    'ui/img/bg.png',
	'ui/img/safe.png',
	'ui/img/Dmg.png',
	'ui/img/keypad.png',
	'ui/img/postitt.png',
	'ui/img/Silik.png',
    'ui/sounds/deniedd.mp3',
	'ui/sounds/numField.mp3',
	'ui/sounds/safeopened.mp3',
    'ui/font/DS-Digital.ttf',
	'ui/font/Eastwood.ttf',
	'ui/font/hapole_pencil.ttf',
}
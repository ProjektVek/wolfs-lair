extends Node 

# 0: false // 1: true 
enum {LOAD_ERROR_COULDNT_OPEN, LOAD_SUCCESS} 

const Res_directory = "res://assets/scripts/" 
const Settings_Path = Res_directory + "Settings.cfg" 

var master_bus = AudioServer.get_bus_index("Master") 
var music_bus = AudioServer.get_bus_index("Music") 
var sfx_bus = AudioServer.get_bus_index("SFX") 

var config = ConfigFile.new() 

# valores padroes assumidos por Settings
var Settings = { 
	"VIDEO": {
		"FS": false,
		"HEIGHT": 720,
		"WIDTH": 1280
	},
	"AUDIO": {
		"MUTE": false,
		"MUSIC": -12,
		"SOUND_EFFECTS": -12 
	},
	"LANG": { 
		"LOCALE": "en_US"  
	} 
} 


# load 
func _load_Settings(): 
	var error = config.load(Settings_Path)

	if error != OK: 
		print("Error loading the settings. Error code: %s" % error) 
		return LOAD_ERROR_COULDNT_OPEN 

	for section in Settings.keys(): 
		for key in Settings[section]: 
			var val = config.get_value(section, key) 
			Settings[section][key] = val 

	return LOAD_SUCCESS 


# cria um arquivo generico com os valores de "Settings"
func _save_Settings(): 
	for section in Settings.keys(): 
		for key in Settings[section]: 
			config.set_value(section, key, Settings[section][key]) 

	config.save(Settings_Path) 

# aplica as configuracoes 
func _apply_Settings(): 
	OS.window_size = Vector2(Settings.VIDEO.WIDTH, Settings.VIDEO.HEIGHT) 
	OS.window_fullscreen = Settings.VIDEO.FS 

	AudioServer.set_bus_mute(master_bus, Settings.AUDIO.MUTE) 
	AudioServer.set_bus_volume_db(music_bus, Settings.AUDIO.MUSIC) 
	AudioServer.set_bus_volume_db(sfx_bus, Settings.AUDIO.SOUND_EFFECTS) 


# testa se o arquivo de configuracoes existe e da load, caso falhe chama _save 
func _ready(): 
	if _load_Settings() == LOAD_ERROR_COULDNT_OPEN: 
		_save_Settings() 

	_apply_Settings() 


# chamar essa funcao para dar update no arquivo 
func update_Settings(H, W, Full, Audio, Mute, local): 
	Settings.VIDEO.FS = Full 
	Settings.VIDEO.HEIGHT = H 
	Settings.VIDEO.WIDTH = W 

	Settings.AUDIO.MUTE = Mute 
	Settings.AUDIO.MUSIC = Audio.x 
	Settings.AUDIO.SOUND_EFFECTS = Audio.y 

	Settings.LANG.LOCALE = local 

	_save_Settings() 
	_apply_Settings() 


# chamar essa funcao para dar update somente no idioma 
func update_Lang(local): 
	Settings.LANG.LOCALE = local 
	_save_Settings() 


# chamar essa funcao para retornar o idioma selecionado 
func get_Lang(): 
	return Settings.LANG.LOCALE 

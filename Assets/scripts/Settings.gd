extends Panel

onready var button_sfx = get_parent().get_parent().get_node("Button-Press")

# display block (video)
var Display = {"h": 0, "w": 0}
var FS
var StrSplit

# seleciona visualmente a resolucao atual do jogo
func _check_res():
	var OB = get_node("Resolution/Res_OB")

	for i in OB.get_item_count():
		StrSplit = OB.get_item_text(i).split("x")
		if StrSplit[1] == String(configuration.Settings.VIDEO.HEIGHT) && StrSplit[0] == String(configuration.Settings.VIDEO.WIDTH):
			OB.select(i)

# seleciona visualmente o idioma do jogo
func _check_lang():
	var lang_OB = get_node("Language/Lang_OB")

	for i in lang_OB.get_item_count():
		if lang_OB.get_item_text(i).find(local) != -1: # se achar o texto de 'local', selecione
			lang_OB.select(i)


func _on_Res_OB_item_selected(index):
	StrSplit = get_node("Resolution/Res_OB").get_item_text(index)
	StrSplit = StrSplit.split("x")
	Display.h = StrSplit[1]
	Display.w = StrSplit[0]

# fullscreen
func _on_FS_CB_toggled(button_pressed):
	FS = button_pressed
	button_sfx.play()


# audio block
var Audio = Vector2() # x=st / y=sfx
var Mute

# volume do canal de soundtrack (se -40, mute)
func _on_Music_HS_value_changed(value):
	if value == -40:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), true)
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), false)
	Audio.x = value

# volume do canal de efeitos (se -40, mute)
func _on_SFX_HS_value_changed(value):
	if value == -40:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("SFX"), true)
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("SFX"), false)
	Audio.y = value

# mute
func _on_M_CB_toggled(button_pressed):
	Mute = button_pressed
	button_sfx.play()


# lang block
var local

func _on_Lang_OB_item_selected(index):
	if index == 0:
		local = 'en_US'
	elif index == 1:
		local = 'pt_BR'

	TranslationServer.set_locale(local)


# aplica as configuracoes no arquivo local
func _on_Apply_pressed():
	configuration.update_Settings(Display.h, Display.w, FS, Audio, Mute, local)
	_anim_exit()
	button_sfx.play()

# volta pro menu
func _on_Back_pressed():
	_anim_exit()
	button_sfx.play()

func _anim_exit():
	var position = get_parent().get_parent().get_node("Settings_Position")
	var tween = get_parent().get_node("Animation")
	var settings_pos = Vector2((Display.w.to_float()/2) -690, 0)
	
	tween.interpolate_property(position, "position", settings_pos, 
		Vector2(settings_pos.x +690, Display.h.to_float()*2), 1.2, Tween.TRANS_BACK, Tween.EASE_IN)
	tween.start()

	get_parent().get_parent().get_node("Menu").show()

# executa ao carregar pela primeira vez o menu
func _ready():
	get_node("Fullscreen/FS_CB").pressed = configuration.Settings.VIDEO.FS
	get_node("Mute/M_CB").pressed = configuration.Settings.AUDIO.MUTE
	get_node("Music/Music_HS").value = configuration.Settings.AUDIO.MUSIC
	get_node("SFX/SFX_HS").value = configuration.Settings.AUDIO.SOUND_EFFECTS

	Display.h = configuration.Settings.VIDEO.HEIGHT
	Display.w = configuration.Settings.VIDEO.WIDTH
	FS = get_node("Fullscreen/FS_CB").pressed
	Audio = Vector2(configuration.Settings.AUDIO.MUSIC, configuration.Settings.AUDIO.SOUND_EFFECTS)
	Mute = configuration.Settings.AUDIO.MUTE
	local = configuration.Settings.LANG.LOCALE

	_check_res()
	_check_lang()

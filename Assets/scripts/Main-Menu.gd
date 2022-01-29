extends Control

onready var button_sfx = get_node("Button-Press")

func _ready():
	button_sfx.play()

# comeca o jogo (sem save state no momento)
func _on_Play_pressed():
	button_sfx.play()

# abre menu com os modos (stress-free mode)
func _on_Practice_pressed():
	button_sfx.play()
	
# comeca a animacao da settings
func _on_Settings_pressed():
	var settings_pos = Vector2(configuration.Settings.VIDEO.WIDTH.to_float()/2,
		-configuration.Settings.VIDEO.HEIGHT.to_float())
	
	button_sfx.play()
	var tween_Settings = get_node("Settings_Position/Animation")
	tween_Settings.interpolate_property($Settings_Position, "position", settings_pos, Vector2(settings_pos.x - 690, 0), 1.2, Tween.TRANS_BACK, Tween.EASE_OUT)
	tween_Settings.start()

	get_node("Menu").hide()

# fecha o game
func _on_Exit_pressed():
	get_tree().quit()



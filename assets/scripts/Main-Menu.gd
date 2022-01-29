extends Control

# abre o menu de selecao de modo // jogo
func _on_Play_pressed():
	pass # Replace with function body.

# comeca a animacao da settings
func _on_Settings_pressed():
	var tween_Settings = get_node("Position/Animation")
	tween_Settings.interpolate_property($Position, "position:y", -configuration.Settings.VIDEO.HEIGHT, 0, 1.2, Tween.TRANS_BACK, Tween.EASE_OUT)
	tween_Settings.start()

# fecha o game
func _on_Exit_pressed():
	get_tree().quit()

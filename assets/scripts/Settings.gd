extends Panel


# display block (video)
func _on_Res_OB_item_selected(index):
	pass # Replace with function body.

func _on_FS_CB_toggled(button_pressed):
	pass # Replace with function body.


# audio block
func _on_Music_HS_value_changed(value):
	pass # Replace with function body.

func _on_SFX_HS_value_changed(value):
	pass # Replace with function body.

func _on_M_CB_toggled(button_pressed):
	pass # Replace with function body.


# lang block
func _on_Lang_OB_item_selected(index):
	pass # Replace with function body.


# button block
func _on_Apply_pressed():
	pass

func _on_Back_pressed():
	var position = get_parent().get_parent().get_node("Position")
	var tween = get_parent().get_node("Animation")
	tween.interpolate_property(position, "position:y", 0, configuration.Settings.VIDEO.HEIGHT, 1.2, Tween.TRANS_BACK, Tween.EASE_IN)
	tween.start()

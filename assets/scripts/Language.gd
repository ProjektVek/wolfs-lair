extends Control

var lang_ID

# executada assim que a tela carrega 
func _ready(): 
	var opt_menu = get_node("Lang-Options") 

	if configuration.Settings.LANG.LOCALE == 'en_US': 
		opt_menu.select(0)
		lang_ID = 'en_US'
	elif configuration.Settings.LANG.LOCALE == 'pt_BR': 
		opt_menu.select(1)
		lang_ID = 'pt_BR'

	TranslationServer.set_locale(lang_ID)


# Recupera o valor de language_id e salva em no config-file local. 
func _on_Select_pressed():
	configuration.update_Lang(lang_ID) 
	get_tree().change_scene("res://scenes/Main-Menu.tscn")   


# Ao trocar o idioma, traduza. 
func _on_LangOptions_item_selected(index):
	if index == 0:
		lang_ID = 'en_US' 
	elif index == 1: 
		lang_ID = 'pt_BR' 

	TranslationServer.set_locale(lang_ID) 

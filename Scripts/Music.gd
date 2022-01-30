extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var is_loop_on = false
var game_scene = "main_menu"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func toggle_loop():
	is_loop_on = !is_loop_on
	return is_loop_on

func continue_play(boolean):
	if !boolean:
		if !self.playing:
			self.play()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	continue_play(self.is_loop_on)
	pass

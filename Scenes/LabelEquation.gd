extends "res://Scripts/Calculator/Equation.gd"

var PATH = "res://Scripts/Calculator/Equation.gd"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	load_equation() 
	pass # Replace with function body.

func load_equation():
	var equation = load(PATH)
	randomize_numbers()
	print(get_number_1(), " + ", get_number_2())
	
	var sum = generate_sum()
	self.text = str(sum)
	pass 

extends "res://Scripts/Calculator/Equation.gd"

var PATH = "res://Scripts/Calculator/Equation.gd"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var sum = -1
var numbers = 9
var list = []

# Called when the node enters the scene tree for the first time.
func _ready():
	list.append(load_equation())
	random_numbers() 
	pass # Replace with function body.

func load_equation():
	var equation = load(PATH)
	randomize_numbers()
	self.text = str(get_number_1(), " + ", get_number_2())
	var sum = generate_sum()
	self.sum = sum
	self.text = str(sum)
	return sum
	
func random_numbers(numbers = (self.numbers - 1), index = -1):
	var rng = RandomNumberGenerator.new()
	# var number_range = self.sum
	rng.randomize()
	var list = []
	for i in range(numbers):
			list.append(rng.randi_range(0 , 100))
	list.append(self.sum)
	print("lista: ", list)
	list = self.list
	return list

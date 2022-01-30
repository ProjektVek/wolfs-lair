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
	random_numbers()
	fill_side_group() 
	generate_new_ordened_list()
	pass # Replace with function body.

func load_equation():
	var equation = load(PATH)
	randomize_numbers()
	self.text = str(get_number_1(), " + ", get_number_2())
	var sum = generate_sum()
	self.sum = sum
	self.text = str(sum)
	return sum
	
func random_numbers(last_char = 100):
	numbers = 8
	var rng = RandomNumberGenerator.new()
	# var number_range = self.sum
	rng.randomize()
	var list = []
	for i in range(numbers):
			list.append(rng.randi_range(0 , last_char))
	list.append(self.sum)
	self.list = list
	return list

func fill_side_group():
	
	for button in get_tree().get_nodes_in_group("left_calc"):
		button.text = str(self.list.pop_front())
	pass
	
func generate_new_ordened_list(old_list = random_numbers()):
	var new_list = [1,2,3,4,5,6,7,8,9]
	var fill_list = random_numbers()
	var position_list = generator_random_list(9)
	for i in range(9):
		var number = self.list[i]
		#rint(position_list[i],": ",number)
		var position = position_list[i]
		new_list.remove(position)
		new_list.insert(position,number)
		print("old list number:",new_list)
		
		#ew_list[position_list[i]] = number
			
	print('Position List: ', position_list)
	print('Nova Lista: ' , new_list)
	return new_list

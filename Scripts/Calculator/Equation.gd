extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var number_1 = -1
var number_2 = -2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init():
	pass

func randomize_numbers():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	number_1 = rng.randi()
	number_1 = number_1 % 51
	number_2 = rng.randi_range(1,50)
	
	var message = str('log: Números Randomizados... ', number_1, ' e ', number_2)
	print(message)
	
	var pair_value = [number_1, number_2]
	return pair_value

func generate_sum():
	var sum = number_1 + number_2
	print('log: Soma Gerada: ', sum)
	return sum

func generate_subtraction():
	var subtraction = number_1 - number_2
	return subtraction

func generate_answers():
	var rng = RandomNumberGenerator.new()
	var answers
	return answers
	
func get_numbers_printed():
	print(number_1)
	print(number_2)
	pass

func get_number_1():
	return number_1

func get_number_2():
	return number_2
	
func generator_random_list(number = 9):
	var list = []
	for i in range(number):
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		var random_number = rng.randi_range(1,number)
		if random_number in list:
			while random_number in list:
				random_number = rng.randi_range(1,number)
			list.append(random_number)
		else:
			list.append(random_number)
	return list
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

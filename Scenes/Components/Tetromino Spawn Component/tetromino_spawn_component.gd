extends Node

@export var tetromino_bag = []

func _on_timer_timeout():
	var rng = RandomNumberGenerator.new()
	var random_array_number = rng.randi_range(0, tetromino_bag.size() - 1)
	var tetromino_instance = tetromino_bag[random_array_number].instantiate()
	print(random_array_number)

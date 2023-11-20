extends Node

@export var tetromino_bag = []
@export var tetromino_spawn_time: float

func _ready():
	tetromino_spawn_time = get_node("Timer").wait_time

func change_spawn_timer_time(new_timer):
	tetromino_spawn_time = new_timer

func _on_timer_timeout():
	var random_element = tetromino_bag.pick_random()
	var selected_tetromino_instance = random_element.instantiate()
	get_parent().add_child(selected_tetromino_instance)

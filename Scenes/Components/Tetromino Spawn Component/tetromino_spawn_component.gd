extends Node
class_name TetrominoSpawnComponent

static var controlling_tetromino_piece = false
static var controlled_tetromino_piece: Node2D

@export var tetromino_bag = []

func _process(_delta):
	if controlling_tetromino_piece == false:
		spawn_random_piece(tetromino_bag)

func spawn_random_piece(_tetromino_bag):
	controlling_tetromino_piece = true
	var random_element = _tetromino_bag.pick_random()
	var _selected_tetromino_piece = random_element.instantiate()
	get_parent().add_child.call_deferred(_selected_tetromino_piece)

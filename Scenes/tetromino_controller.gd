extends CharacterBody2D

@onready var tetromino_spawn_component = $TetrominoSpawnComponent
@onready var movement_interval_timer = get_node("MovementIntervalTimer")

func _physics_process(_delta):
	movement()
	
	if Input.is_action_just_pressed("hard_drop"):
		input_hard_drop(tetromino_spawn_component.controlled_tetromino_piece)

func movement():
	var horizontal_input = Input.get_axis("move_left", "move_right")
	if movement_interval_timer.time_left == 0:
		if horizontal_input != 0:
			velocity.x = horizontal_input * 1500
			move_and_slide()
			movement_interval_timer.start()

func input_hard_drop(object):
	var position = object.get_global_position()
	object.set_global_position(position.x, 1152)
	piece_is_placed() 

func piece_is_placed():
	tetromino_spawn_component.controlling_tetromino_piece = false

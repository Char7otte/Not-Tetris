extends CharacterBody2D

@onready var movement_interval_timer = get_node("MovementIntervalTimer")

func _physics_process(_delta):
	movement()
	print(movement_interval_timer.time_left)

func movement():
	var horizontal_input = Input.get_axis("move_left", "move_right")
	if movement_interval_timer.time_left == 0:
		if horizontal_input != 0:
			velocity.x = horizontal_input * 1500
			move_and_slide()
			movement_interval_timer.start()


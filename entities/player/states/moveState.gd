extends State

@export var player: Player

func calculate_velocity(input_vector: Vector2) -> Vector2:
	if input_vector.length() == 0:
		return Vector2.ZERO
	return input_vector.normalized() * player.move_speed

func physics_update(_delta: float)-> void:
	var h = Input.get_axis("Left", "Right")
	var v = Input.get_axis("Up", "Down")
	var input_vector: Vector2 = Vector2(h,v)
	
	if input_vector==Vector2.ZERO:
		transition.emit(self, "idle")
		return 
	
	if h >0:
		player.facing = "Right"
	elif h < 0:
		player.facing = "Left"
	
	player.velocity = calculate_velocity(input_vector)
	player.move_and_slide()

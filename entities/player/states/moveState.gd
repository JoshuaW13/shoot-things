extends State

@export var player: Player

func physics_update(_delta: float)-> void:
	var h: float = Input.get_axis("Left", "Right")
	var v: float = Input.get_axis("Up", "Down")
	var input_vector: Vector2 = Vector2(h,v)
	
	if input_vector==Vector2.ZERO:
		transition.emit(self, "idle")
		return 
	
	if h >0:
		player.facing = "Right"
	elif h < 0:
		player.facing = "Left"
	
	player.velocity_component.accelerate_in_direction(input_vector.normalized())
	player.velocity_component.move(player)

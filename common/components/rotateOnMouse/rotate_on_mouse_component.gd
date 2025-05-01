extends Node2D
class_name RotateOnMouseComponent

@export var patient: Node2D
@export var flip_on_mouse: FlipOnMouseComponent

func _process(_delta: float) -> void:
	if patient:
		var mouse_pos: Vector2 = get_global_mouse_position()
		var to_mouse: Vector2 = mouse_pos - patient.global_position
		var angle: float = to_mouse.angle()
		
		if flip_on_mouse and flip_on_mouse.facing == flip_on_mouse.Facing.LEFT:
			patient.rotation = PI - angle
		else:
			patient.rotation = angle

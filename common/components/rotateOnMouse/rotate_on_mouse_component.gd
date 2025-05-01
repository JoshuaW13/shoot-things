extends Node2D
class_name RotateOnMouseComponent

@export var patient: Node2D

func _process(_delta: float) -> void:
	if patient:
		var mouse_pos = get_global_mouse_position()
		var to_mouse = mouse_pos - patient.global_position
		var angle = to_mouse.angle()

		patient.rotation = angle

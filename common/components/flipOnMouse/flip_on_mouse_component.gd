extends Node2D
class_name FlipOnMouseComponent

signal scale_changed

@export var patient: Node2D

enum Facing {LEFT, RIGHT}
var facing: Facing = Facing.RIGHT

func _process(_delta: float) -> void:
	if patient:
		var direction: Vector2 = get_global_mouse_position() - patient.global_position
		
		if direction.x < 0 and facing == Facing.RIGHT:
			facing = Facing.LEFT
			patient.scale.x = -1
			scale_changed.emit()
		
		elif direction.x > 0 and facing == Facing.LEFT:
			facing = Facing.RIGHT
			patient.scale.x = 1 
			scale_changed.emit()

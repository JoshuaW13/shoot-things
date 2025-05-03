extends Node2D
class_name  FlipOnVelocity

signal scale_changed

@export var patient: Node2D
@export var velocity_component: VelocityComponent

enum Facing {LEFT, RIGHT}
var facing: Facing = Facing.RIGHT

func _process(_delta: float) -> void:
	if patient and velocity_component:
		
		if velocity_component.velocity.x<0 and facing == Facing.RIGHT:
			facing = Facing.LEFT
			patient.scale.x = -1
			scale_changed.emit()
		
		elif velocity_component.velocity.x >0 and facing == Facing.LEFT:
			facing = Facing.RIGHT
			patient.scale.x = 1 
			scale_changed.emit()

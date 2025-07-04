extends State

@export var skeleton: Skeleton

func physics_update(_delta: float)-> void:
	var direction_to_player: Vector2 = skeleton.position.direction_to(skeleton.player.global_position)
	skeleton.velocity_component.accelerate_in_direction(direction_to_player.normalized())
	skeleton.velocity_component.move(skeleton)

func exit()->void:
	skeleton.velocity_component.stop(skeleton)

func _on_health_component_current_health_changed(difference: float) -> void:
	if difference < 0:
		transition.emit(self, "Stunned")

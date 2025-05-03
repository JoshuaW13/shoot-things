extends State

@export var zombie: Zombie

func physics_update(_delta: float)-> void:
	var direction_to_player: Vector2 = zombie.position.direction_to(zombie.player.global_position)
	zombie.velocity_component.accelerate_in_direction(direction_to_player.normalized())
	zombie.velocity_component.move(zombie)

func exit()->void:
	zombie.velocity_component.stop(zombie)

func _on_health_component_current_health_changed(difference: float) -> void:
	if difference < 0:
		transition.emit(self, "Stunned")

extends Area2D
class_name HitboxComponent

signal hurtbox_hit

@export var damage: float = 0

func _on_area_entered(area: Area2D) -> void:
	if area is HurtboxComponent:
		hurtbox_hit.emit()

func enable()->void:
	set_deferred("monitorable", true)
	set_deferred("monitoring", true)

func disable()->void:
	set_deferred("monitorable", false)
	set_deferred("monitoring", false)

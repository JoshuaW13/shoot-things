extends Area2D
class_name HitboxComponent

signal hurtbox_hit

@export var damage: float = 0

func _on_area_entered(area: Area2D) -> void:
	if area is HurtboxComponent:
		hurtbox_hit.emit()

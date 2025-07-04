extends CharacterBody2D
class_name Skeleton

const SKELETON_DAMAGE = 2.0

func _on_health_component_health_depleted() -> void:
	self.queue_free()

extends Area2D
class_name HurtboxComponent

@export var health_component: HealthComponent

func apply_damage(damage: float)->void:
	if health_component:
		health_component.deal_damage(damage)

func _on_area_entered(other_area: Area2D) -> void:
	if other_area is HitboxComponent:
		apply_damage(other_area.damage)

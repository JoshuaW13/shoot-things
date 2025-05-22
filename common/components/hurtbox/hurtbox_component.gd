extends Area2D
class_name HurtboxComponent

@export var health_component: HealthComponent

func _get_configuration_warnings() -> PackedStringArray:
	var warnings: PackedStringArray = PackedStringArray()

	if not health_component:
		warnings.append("Health component not set.")

	return warnings


func apply_damage(damage: float)->void:
	if health_component:
		health_component.deal_damage(damage)

func _on_area_entered(other_area: Area2D) -> void:
	if other_area is HitboxComponent:
		apply_damage(other_area.damage)

func disable()->void:
	set_deferred("monitorable", false)
	set_deferred("monitoring", false)

func enable()->void:
	set_deferred("monitorable", true)
	set_deferred("monitoring", true)

extends Area2D
class_name HurtboxComponent

@export var health_component: HealthComponent

func _on_area_entered(area: Area2D) -> void:
	print("Another area entered")
	pass # Replace with function body.

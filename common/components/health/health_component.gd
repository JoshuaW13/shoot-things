extends Node2D
class_name HealthComponent

signal health_depleted
signal current_health_changed(difference: float)

@export var max_health: float = 10

var current_health: float:
	get:
		return current_health
	set(value):
		var prev_health = current_health
		if value>max_health:
			current_health = max_health
		elif value<0:
			current_health = 0
		else:
			current_health = value
		if current_health != prev_health:
			current_health_changed.emit(current_health-prev_health)

func _ready() -> void:
	current_health = max_health

func deal_damage(damage: float)->void:
	current_health = current_health - damage
	if current_health <= 0:
		health_depleted.emit()

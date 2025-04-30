extends Node2D
class_name HealthComponent

signal health_depleted

@export var max_health = 10

var current_health: int:
	get:
		return current_health
	set(value):
		if value>max_health:
			current_health = max_health
		elif value<0:
			current_health = 0
		else:
			current_health = value

func _ready() -> void:
	current_health = max_health

func deal_damage(damage)->void:
	current_health = current_health - damage

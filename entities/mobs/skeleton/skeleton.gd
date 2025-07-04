extends CharacterBody2D
class_name Skeleton

@export var player: Player

@onready var velocity_component: VelocityComponent = %VelocityComponent
@onready var health_component: HealthComponent= %HealthComponent

const SKELETON_DAMAGE = 2.0

func _ready() -> void:
	velocity_component.speed = 120
	health_component.max_health = 2.0

func _on_health_component_health_depleted() -> void:
	self.queue_free()

func _on_health_component_current_health_changed(_difference: float) -> void:
	if _difference <0:
		velocity_component.speed = velocity_component.speed/2.0

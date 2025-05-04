extends CharacterBody2D
class_name Zombie

@export var player: Player

@onready var velocity_component: VelocityComponent = $VelocityComponent
@onready var hurtbox_component: HurtboxComponent = %HurtboxComponent
@onready var hitbox_component: HitboxComponent = %HitboxComponent
@onready var health_component: HealthComponent = $HealthComponent
@onready var facing_controller: FlipOnVelocity = $FlipOnVelocity
@onready var flip_pivot: Node2D = $Pivot

const ZOMBIE_MAX_HEALTH = 3.0
const ZOMBIE_DAMAGE = 1.0

func _ready() -> void:
	health_component.max_health = ZOMBIE_MAX_HEALTH
	health_component.current_health = health_component.max_health
	hurtbox_component.health_component = health_component
	hitbox_component.damage = ZOMBIE_DAMAGE
	facing_controller.patient = flip_pivot 
	facing_controller.velocity_component = velocity_component

func _on_health_component_health_depleted() -> void:
	self.queue_free()

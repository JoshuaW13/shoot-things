extends CharacterBody2D

@export var player: Player

@onready var velocity_component: VelocityComponent = $VelocityComponent
@onready var hurtbox_component: HurtboxComponent = %HurtboxComponent
@onready var health_component: HealthComponent = $HealthComponent
@onready var facing_controller: FlipOnVelocity = $FlipOnVelocity
@onready var flip_pivot: Node2D = $Pivot

const ZOMBIE_MAX_HEALTH = 3.0

func _ready() -> void:
	health_component.max_health = ZOMBIE_MAX_HEALTH
	health_component.current_health = health_component.max_health
	hurtbox_component.health_component = health_component
	facing_controller.patient = flip_pivot 
	facing_controller.velocity_component = velocity_component

func _physics_process(_delta: float) -> void:
	var direction_to_player: Vector2 = position.direction_to(player.global_position)
	velocity_component.accelerate_in_direction(direction_to_player.normalized())
	velocity_component.move(self)

func _on_health_component_health_depleted() -> void:
	self.queue_free()

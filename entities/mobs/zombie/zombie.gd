extends CharacterBody2D

@export var player: Player

@onready var velocity_component: VelocityComponent = $VelocityComponent
@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent
@onready var health_component: HealthComponent = $HealthComponent

var facing: String = "Right":
	get:
		return facing
	set(value):
		if value != facing:
			facing = value

func check_facing()->void:
	if velocity.x >0 and facing != "Right":
		facing = "Right"
		scale.x = -1
	elif velocity.x <0 and facing != "Left":
		facing = "Left"
		scale.x = -1

func _ready() -> void:
	health_component.max_health = 3.0
	health_component.current_health = health_component.max_health
	hurtbox_component.health_component = health_component

func _physics_process(_delta: float) -> void:
	var direction_to_player: Vector2 = position.direction_to(player.global_position)
	velocity_component.accelerate_in_direction(direction_to_player.normalized())
	velocity_component.move(self)
	check_facing()

func _on_health_component_health_depleted() -> void:
	self.queue_free()

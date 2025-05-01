extends CharacterBody2D

@export var player: Player

@onready var velocity_component: VelocityComponent = $VelocityComponent

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

func _physics_process(_delta: float) -> void:
	var direction_to_player: Vector2 = position.direction_to(player.global_position)
	velocity_component.accelerate_in_direction(direction_to_player.normalized())
	velocity_component.move(self)
	check_facing()

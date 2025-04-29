extends CharacterBody2D

@export var player: Player
@export var speed: int = 40

var facing: String = "Right":
	get:
		return facing
	set(value):
		if value != facing:
			facing = value
			scale.x = -1

func check_facing()->void:
	if velocity.x >0:
		facing = "Right"
	elif velocity.x <0:
		facing = "Left"

func _physics_process(_delta: float) -> void:
	var direction_to_player = position.direction_to(player.global_position)
	velocity = direction_to_player*speed
	check_facing()
	move_and_slide()

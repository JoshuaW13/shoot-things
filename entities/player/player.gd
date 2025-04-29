extends CharacterBody2D
class_name Player

@export var move_speed = 250

@onready var sprite: Sprite2D = $Sprite2D
@onready var velocity_component: VelocityComponent = $VelocityComponent

var facing: String = "Right":
	get:
		return facing
	set(value):
		if value != facing:
			facing = value
			scale.x = -1

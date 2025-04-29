extends CharacterBody2D
class_name Player

@export var move_speed = 250

@onready var sprite = $Sprite2D

var facing: String = "Right":
	get:
		return facing
	set(value):
		if value != facing:
			facing = value
			scale.x = -1

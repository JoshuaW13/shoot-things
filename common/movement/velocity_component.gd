extends Node2D
class_name VelocityComponent

@export var speed = 250
var velocity: Vector2 = Vector2.ZERO

func accelerate_in_direction(direction: Vector2)->void:
	velocity = direction.normalized()*speed

func move(character_body:CharacterBody2D)->void:
	character_body.velocity = velocity
	character_body.move_and_slide()

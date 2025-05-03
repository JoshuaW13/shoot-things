extends CharacterBody2D
class_name Bullet

@onready var velocity_component: VelocityComponent = $VelocityComponent

var bullet_range: float = 0
var fire_direction: Vector2 = Vector2.ZERO
var distance_traveled: float = 0

func _physics_process(_delta: float) -> void:
	if fire_direction != Vector2.ZERO and bullet_range !=0:
		velocity_component.accelerate_in_direction(fire_direction)
		var movement: Vector2 = velocity_component.move(self)
		distance_traveled += movement.length()
		if distance_traveled>= bullet_range:
			queue_free()

func setup(muzzle_speed: float, direction:Vector2, gun_range: float)->void:
	velocity_component.speed = muzzle_speed
	bullet_range = gun_range
	fire_direction = direction

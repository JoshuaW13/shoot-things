extends Gun

@onready var muzzle: Marker2D = $muzzle
@onready var cooldown_timer: Timer = $Timer

@export var muzzle_speed: float = 325
@export var gun_range: float = 1000
@export var gun_cooldown: float = 0.5

var bullet_resource: Resource = preload("res://entities/bullets/bullet/Bullet.tscn")

func _ready() -> void:
	cooldown_timer.wait_time = gun_cooldown
	cooldown_timer.one_shot = true

func shoot()->void:
	if  cooldown_timer.is_stopped():
		var new_bullet_instance: Bullet = bullet_resource.instantiate()
		
		new_bullet_instance.global_position = muzzle.global_position
		new_bullet_instance.rotation = muzzle.global_rotation
		new_bullet_instance.scale = muzzle.global_scale
		
		get_tree().current_scene.add_child(new_bullet_instance)
		
		var direction: Vector2 = get_global_mouse_position() - self.global_position
		new_bullet_instance.setup(muzzle_speed, direction.normalized(), gun_range)
		
		cooldown_timer.start()

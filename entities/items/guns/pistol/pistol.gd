extends Gun

@onready var muzzle: Marker2D = $muzzle

var bullet_resource: Resource = preload("res://entities/bullets/bullet/Bullet.tscn")

func shoot()->void:
	var new_bullet_instance: Bullet = bullet_resource.instantiate()
	new_bullet_instance.global_position = muzzle.global_position
	new_bullet_instance.rotation = muzzle.global_rotation
	new_bullet_instance.scale = muzzle.global_scale
	get_tree().current_scene.add_child(new_bullet_instance)

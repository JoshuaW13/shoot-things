extends StaticBody2D

@export var wood_scene: PackedScene = load("res://entities/objects/wood/wood.tscn")

func _on_health_component_health_depleted() -> void:
	for i in 3:
		var new_wood: Wood = wood_scene.instantiate()
		new_wood.position = position
		get_tree().current_scene.add_child(new_wood)
	queue_free()

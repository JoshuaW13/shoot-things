extends StaticBody2D

@export var wood_scene: PackedScene = load("res://entities/objects/wood/wood.tscn")

@onready var point_spawner: PointSpawner = %PointSpawner

func _ready() -> void:
	point_spawner.origin = position
	point_spawner.max_distance = 50

func _on_health_component_health_depleted() -> void:
	for i in 3:
		point_spawner.spawn(wood_scene)
	queue_free()

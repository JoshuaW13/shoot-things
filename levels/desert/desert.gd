extends Node2D

@onready var tileMap: Node2D = $TileMap

var rectangular_space: Rect2i
var tile_cell_size: Vector2i
var tileMapLayers: Array[TileMapLayer] = []

func _ready() -> void:
	get_rectangular_space()
	var left_limit = rectangular_space.position.x*tile_cell_size.x
	var right_limit = rectangular_space.end.x*tile_cell_size.x
	var top_limit = rectangular_space.position.y*tile_cell_size.y
	var bottom_limit = rectangular_space.end.y*tile_cell_size.y
	SignalBus.level_limits.emit(left_limit, right_limit, top_limit, bottom_limit)


func get_rectangular_space() -> void:
	set_tile_map_layers()
	for layer in tileMapLayers:
		if layer.get_used_rect().get_area()>rectangular_space.get_area():
			tile_cell_size = layer.tile_set.tile_size
			rectangular_space = layer.get_used_rect()

func set_tile_map_layers()->void:
	for layer in tileMap.get_children():
		tileMapLayers.append(layer)

extends Node2D
class_name Wood

var wood_item: BlockItem = load("res://entities/objects/woodBlock/wood_block.tres")

func _on_area_2d_area_entered(_area: Area2D) -> void:
	SignalBus.item_picked.emit(wood_item)
	queue_free()

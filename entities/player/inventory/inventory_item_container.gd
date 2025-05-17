extends MarginContainer
class_name InventoryItemContainer

@onready var item_texture: TextureRect = %TextureRect

var is_set: bool = false

func set_item(item: InventoryItem)->void:
	item_texture.texture = item.icon
	is_set = true

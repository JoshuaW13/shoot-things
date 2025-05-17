extends Node
class_name Inventory

signal item_added(item:InventoryItem)

var items: Array[InventoryItem] = []
var current_item_index: int = 0

func _ready() -> void:
	await owner.ready
	var pistol_item: GunItem = preload("res://entities/items/guns/pistol/pistol_item.tres")
	add_item(pistol_item)

func add_item(item: InventoryItem)->void:
	if item.type == InventoryItem.ItemType.BLOCK:
		for existing_item in items:
			if existing_item.name == item.name and existing_item is BlockItem:
				existing_item.count += item.count
				return
	elif not has_item(item.name):
		items.append(item)
		item_added.emit(item)

func has_item(item_name: String) -> bool:
	for i in items:
		if i.name == item_name:
			return true
	return false

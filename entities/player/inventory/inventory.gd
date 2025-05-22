extends Node
class_name Inventory

const MIN_SLOT = 0
const MAX_SLOT = 9

signal item_added(item:InventoryItem)
signal selected_item_changed()

var items: Array[InventoryItem] = []

var selected_item_index: int = -1:
	set(inventory_slot):
		if selected_item_instance and selected_item_instance.interruptable == false:
			selected_item_instance.interruptable_changed.connect(func()->void:
				selected_item_index = inventory_slot
				)
			return
		if inventory_slot != selected_item_index:
			if inventory_slot >= MIN_SLOT and inventory_slot <= MAX_SLOT:
				selected_item_index = inventory_slot
				selected_item = items[inventory_slot]
			else:
				print("bad inventory swap!")

var selected_item: InventoryItem = null:
	set(item):
		selected_item = item
		if selected_item:
			selected_item_instance = selected_item.scene_data.instantiate()
		else:
			selected_item_instance = null
		selected_item_changed.emit()

var selected_item_instance: Item = null:
	set(value):
		if selected_item_instance:
			selected_item_instance.queue_free()
		selected_item_instance = value

func _ready() -> void:
	await owner.ready
	items.resize(10)
	var pistol_item: GunItem = preload("res://entities/items/guns/pistol/pistol_item.tres")
	var hatchet_item: ToolItem = preload("res://entities/items/tools/axes/hatchet/hatchet.tres")
	add_item(pistol_item)
	add_item(hatchet_item)
	selected_item_index = 0

func add_item(item: InventoryItem)->void:
	if item.type == InventoryItem.ItemType.BLOCK:
		for existing_item in items:
			if existing_item.name == item.name and existing_item is BlockItem:
				existing_item.count += item.count
				return
	elif not has_item(item.name):
		add_new_item(item)
		item_added.emit(item)

func add_new_item(item: InventoryItem)->void:
	for i in items.size():
		if items[i] ==null:
			items[i] = item
			break

func has_item(item_name: String) -> bool:
	for i in items:
		if i:
			if i.name == item_name:
				return true
	return false

extends Control
class_name InventoryBar

@export var inventory: Inventory

@onready var inventory_item_hbox: HBoxContainer = %HBoxContainer

var inventory_item_containers: Array[InventoryItemContainer] = []

func initialize_inventory()->void:
	if inventory:
		for i in inventory.items.size():
			var item: InventoryItem = inventory.items[i]
			var container: InventoryItemContainer = inventory_item_containers[i]
			container.set_item(item)

func initialize_ui_containers()-> void:
	var hbox_children : Array = inventory_item_hbox.get_children()
	for child: Variant in hbox_children:
		if child is InventoryItemContainer:
			inventory_item_containers.push_back(child)

func _ready() -> void:
	initialize_ui_containers()
	initialize_inventory()

func _on_inventory_item_added(item: InventoryItem) -> void:
	for container in inventory_item_containers:
		if !container.is_set:
			container.set_item(item)
			return

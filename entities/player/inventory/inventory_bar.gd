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
			child.slot_index = inventory_item_containers.size()-1
			child.got_focus.connect(on_inventory_container_got_focus)

func _ready() -> void:
	initialize_ui_containers()
	initialize_inventory()

func _on_inventory_item_added(item: InventoryItem) -> void:
	for container in inventory_item_containers:
		if !container.is_set:
			container.set_item(item)
			return

func _process(_delta: float) -> void:
	for i in 10:
		if Input.is_action_just_pressed("slot_%d" % i):
			inventory.selected_item_index = i

func _on_inventory_selected_item_changed() -> void:
	var inventory_slot: InventoryItemContainer = inventory_item_containers[inventory.selected_item_index]
	inventory_slot.get_focus()

func on_inventory_container_got_focus(index: int)->void:
	inventory.selected_item_index = index

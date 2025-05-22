extends CharacterBody2D
class_name Player

@onready var velocity_component: VelocityComponent = $VelocityComponent
@onready var player_direction_controller: FlipOnMouseComponent = $FlipOnMouseComponent
@onready var item_direction_controller: RotateOnMouseComponent = %RotateOnMouseComponent
@onready var flip_pivot: Node2D = $Pivot
@onready var camera: Camera2D = $Camera2D
@onready var inventory: Inventory = %Inventory
@onready var inventory_bar_ui: InventoryBar = %InventoryBar

var selected_item: Item = null
var primary_action_held: bool = false

func _ready() -> void:
	player_direction_controller.patient = flip_pivot
	item_direction_controller.patient = selected_item
	item_direction_controller.flip_on_mouse = player_direction_controller
	SignalBus.level_limits.connect(on_level_limits)
	inventory_bar_ui.inventory = inventory

func _process(_delta: float) -> void:
	if primary_action_held and selected_item:
		selected_item.primary_action()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("PrimaryAction"):
		primary_action_held = true
	elif event.is_action_released("PrimaryAction"):
		primary_action_held = false

func _on_health_component_health_depleted() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://levels/titleScreen/titleScreen.tscn")

func on_level_limits(left_limit:int, right_limit:int, top_limit:int, bottom_limit:int)->void:
	camera.set_limit(SIDE_LEFT,left_limit)
	camera.set_limit(SIDE_RIGHT,right_limit)
	camera.set_limit(SIDE_TOP,top_limit)
	camera.set_limit(SIDE_BOTTOM,bottom_limit)

func _on_inventory_selected_item_changed() -> void:
	if selected_item:
		selected_item = null
		item_direction_controller.patient = null
	if inventory.selected_item_instance:
		selected_item = inventory.selected_item_instance
		if selected_item is Gun:
			item_direction_controller.patient = selected_item
		flip_pivot.add_child(selected_item)

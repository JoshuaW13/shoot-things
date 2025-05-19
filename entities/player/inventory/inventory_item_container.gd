extends MarginContainer
class_name InventoryItemContainer

signal got_focus(slot_index: int)

@onready var item_texture: TextureRect = %TextureRect
@onready var texture_button: TextureButton = $TextureButton

var is_set: bool = false
var slot_index: int = -1

func set_item(item: InventoryItem)->void:
	item_texture.texture = item.icon
	is_set = true

func get_focus()->void:
	texture_button.grab_focus()

func _on_texture_button_focus_entered() -> void:
	got_focus.emit(slot_index);

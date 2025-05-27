extends InventoryItem
class_name BlockItem

signal count_changed(new_count: int)

var count: int = 1:
	set(new_count):
		count = new_count
		count_changed.emit(new_count)

func _init()->void:
	type = ItemType.BLOCK

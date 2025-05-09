extends InventoryItem
class_name BlockItem

var count: int = 1

func _init()->void:
	type = ItemType.BLOCK

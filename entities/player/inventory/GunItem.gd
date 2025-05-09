extends InventoryItem
class_name GunItem

@export var ammo: int = 0

func _init()->void:
	type = ItemType.GUN

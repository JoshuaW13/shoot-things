extends Node2D
class_name  Item

signal interruptable_changed()

var interruptable: bool = true:
	set(new_value):
		interruptable = new_value
		interruptable_changed.emit()

func primary_action()->void:
	pass

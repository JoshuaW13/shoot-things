extends Resource
class_name InventoryItem

enum ItemType { GUN, TOOL, BLOCK }

@export var name: String
@export var type: ItemType
@export var scene_data: PackedScene
@export var icon: Texture2D

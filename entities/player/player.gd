extends CharacterBody2D
class_name Player

@onready var velocity_component: VelocityComponent = $VelocityComponent
@onready var player_direction_controller: FlipOnMouseComponent = $FlipOnMouseComponent
@onready var weapon_direction_controller: RotateOnMouseComponent = %RotateOnMouseComponent
@onready var weapon: Node2D = %Pistol
@onready var flip_pivot: Node2D = $Pivot

func _ready() -> void:
	player_direction_controller.patient = flip_pivot
	weapon_direction_controller.patient = weapon

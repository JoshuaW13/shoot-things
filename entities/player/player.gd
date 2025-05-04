extends CharacterBody2D
class_name Player

@onready var velocity_component: VelocityComponent = $VelocityComponent
@onready var player_direction_controller: FlipOnMouseComponent = $FlipOnMouseComponent
@onready var weapon_direction_controller: RotateOnMouseComponent = %RotateOnMouseComponent
@onready var weapon: Gun = %Pistol
@onready var flip_pivot: Node2D = $Pivot

func _ready() -> void:
	player_direction_controller.patient = flip_pivot
	weapon_direction_controller.patient = weapon
	weapon_direction_controller.flip_on_mouse = player_direction_controller

func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("PrimaryAction"):
		weapon.shoot()

func _on_health_component_health_depleted() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://levels/titleScreen/titleScreen.tscn")

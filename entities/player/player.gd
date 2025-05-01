extends CharacterBody2D
class_name Player

@onready var sprite: Sprite2D = $Sprite2D
@onready var velocity_component: VelocityComponent = $VelocityComponent
@onready var player_direction_controller: FlipOnMouseComponent

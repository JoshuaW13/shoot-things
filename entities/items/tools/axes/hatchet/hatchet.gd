extends Tool
class_name Hatchet

@onready var hitbox_component: HitboxComponent = %HitboxComponent

func _ready() -> void:
	hitbox_component.disable()

func use() -> void:
	if interruptable == true:
		interruptable = false
		var tween: Tween = create_tween()

		tween.tween_property(self, "rotation_degrees", -25.0, 0.1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
		tween.tween_callback(func()->void:
			hitbox_component.enable()
		)
		
		tween.tween_property(self, "rotation_degrees", 80.0, 0.25).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
		tween.tween_callback(func()->void:
			hitbox_component.disable()
		)
		
		tween.tween_property(self, "rotation_degrees", 0.0, 0.25).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
		tween.finished.connect(func()->void: interruptable = true)

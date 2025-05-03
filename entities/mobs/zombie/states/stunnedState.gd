extends State

@onready var stun_timer = $StunnedTimer

func enter()->void:
	stun_timer.wait_time = 0.25
	stun_timer.one_shot = true
	stun_timer.start()

func _on_stunned_timer_timeout() -> void:
	transition.emit(self, "Hunt")

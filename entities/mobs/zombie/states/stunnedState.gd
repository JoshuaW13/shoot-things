extends State

@onready var stun_timer: Timer = $StunnedTimer

@export var zombie: Zombie 

func enter()->void:
	zombie.hurtbox_component.disable()
	stun_timer.wait_time = 0.20
	stun_timer.one_shot = true
	stun_timer.start()

func _on_stunned_timer_timeout() -> void:
	zombie.hurtbox_component.enable()
	transition.emit(self, "Hunt")

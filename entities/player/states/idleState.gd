extends State

@export var player: Player

func process_input(_event: InputEvent) -> void:
	if _event.is_action_pressed("Left") or _event.is_action_pressed("Right") or _event.is_action_pressed("Up") or _event.is_action_pressed("Down"):
		transition.emit(self, "Move")

func physics_update(_delta: float) -> void:
	var h = 0
	if Input.is_action_pressed("Right"):
		h += 1
	if Input.is_action_pressed("Left"):
		h -= 1

	var v = 0
	if Input.is_action_pressed("Down"):
		v += 1
	if Input.is_action_pressed("Up"):
		v -= 1

	if h != 0 or v != 0:
		transition.emit(self, "Move")

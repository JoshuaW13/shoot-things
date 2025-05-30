extends Node

@export var initial_state : State

var current_state: State
var states : Dictionary[String, State] = {}

func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.transition.connect(on_state_transition)

		if initial_state:
			initial_state.enter()
			current_state = initial_state

func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)

func _unhandled_input(event: InputEvent) -> void:
	if  current_state:
		current_state.process_input(event)

func on_state_transition(state:State, new_state_name: String)->void:
	if state != current_state:
		return
	
	var new_state: State = states.get(new_state_name.to_lower())
	if ! new_state:
		return
	if current_state:
		current_state.exit()
	new_state.enter()
	current_state = new_state

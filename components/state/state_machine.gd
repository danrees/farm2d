class_name StateMachine extends Node2D

@export var default_state: State

var current_state: State

func _ready() -> void:
	if default_state != null:
		change_state(default_state)
	for child in get_children():
		if child is State:
			(child as State).initialize()
			child.transition.connect(change_state_by_name)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_process(delta)

func _process(delta: float) -> void:
	if current_state:
		current_state.process(delta)

func _unhandled_input(event: InputEvent) -> void:
	if current_state:
		current_state.input(event)

func change_state_by_name(new_state: String) -> void:
	var state_node = get_node(new_state)
	if state_node and state_node is State:
		change_state(state_node)

func change_state(new_state: State):
	if new_state == null or new_state == current_state:
		return
	if current_state != null:
		current_state.exit()
	current_state = new_state
	new_state.enter()

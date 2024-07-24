class_name StateMachine extends Node2D

@export var animation: AnimationPlayer = null
@export var player: CharacterBody2D = null
@export var default_state: State

var current_state: State
var current_direction: String = "down"

func _ready() -> void:
	if default_state != null:
		change_state(default_state)
	for child in get_children():
		if child is State:
			(child as State).initialize()


func _physics_process(delta: float) -> void:
	if Input.get_vector("walk_left", "walk_right", "walk_up", "walk_down"):
		change_state(get_node("Walk"))
	else:
		change_state(get_node("Idle"))
	if current_state:
		current_state.physics_process(delta)


func change_state(new_state: State):
	if new_state == null or new_state == current_state:
		return
	if current_state != null:
		current_state.exit()
	current_state = new_state
	new_state.enter()

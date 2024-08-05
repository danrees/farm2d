class_name MovementStateMachine extends StateMachine

@export var animation: AnimationPlayer = null
@export var player: CharacterBody2D = null
# @export var default_state: State

# var current_state: State
var current_direction: String = "down"

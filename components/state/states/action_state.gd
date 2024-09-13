class_name ActionState extends State

@export var action: Action

func physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("action"):
		action._interact()

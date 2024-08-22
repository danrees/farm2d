class_name AxeState extends ToolState

var animation: AnimationPlayer


func initialize():
	var parent = get_parent()
	if parent is MovementStateMachine:
		animation = parent.animation

func enter():
	# spawn the tool sprite and/or animation
	pass
	
func exit():
	# free the tool sprite and/or animation
	pass

func input(event: InputEvent) -> void:
	pass

func physics_process(delta: float) -> void:
	if Input.is_action_pressed("action"):
		animation.play("swing_%s" % owner.current_direction)
		await get_tree().create_timer(cool_down)

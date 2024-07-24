class_name IdleState extends State

var animation: AnimationPlayer

func initialize():
	if owner is StateMachine:
		animation =( owner as StateMachine).animation

func enter():
	if !animation:
		return
	animation.play("idle_%s" % owner.current_direction)
	
func exit():
	pass

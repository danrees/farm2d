class_name IdleState extends State

var animation: AnimationPlayer


func initialize():
	if owner is StateMachine:
		animation =( owner as StateMachine).animation

func enter():
	if !animation:
		return
	animation.play("idle_%s" % owner.current_direction)


func _physics_process(delta: float) -> void:
	if Input.get_vector("walk_left", "walk_right", "walk_up", "walk_down"):
		transition.emit("Walk")

func exit():
	pass

class_name Walk extends State

@export var SPEED: int = 200

# var current_direction: String = "down"
var animation: AnimationPlayer

func initialize():
	if owner is StateMachine:
		animation = (owner as StateMachine).animation

func enter():
	if !animation:
		return
	animation.play("walk_%s" % owner.current_direction)

func exit():
	pass


func physics_process(delta: float) -> void:
	if !owner:
		return
	if !(owner is StateMachine):
		return
	
	var state_body = (owner as StateMachine).player
	if !state_body:
		return
	
	var direction := Input.get_vector("walk_left", "walk_right", "walk_up", "walk_down")
	if direction:
		state_body.velocity = direction.normalized() * SPEED
		# ray_cast_2d.target_position = direction * ray_distance
		_change_direction(state_body)
	else:
		state_body.velocity = Vector2.ZERO
		transition.emit("Idle")
	state_body.move_and_slide()

func _change_direction(body: CharacterBody2D):
	var last_direction = owner.current_direction
	if body.velocity .x > 0:
		owner.current_direction = "right"
	if body.velocity .x < 0:
		owner.current_direction = "left"
	if body.velocity .y > 0:
		owner.current_direction = "down"
	if body.velocity .y < 0:
		owner.current_direction = "up"
	if last_direction != owner.current_direction:
		animation.play("walk_%s" % owner.current_direction)

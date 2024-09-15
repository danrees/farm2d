class_name Walk extends State

@export var SPEED: int = 100
@export var ACCEL: int = 10

# var current_direction: String = "down"
var animation: AnimationPlayer

func initialize():
	if owner is MovementStateMachine:
		animation = owner.animation

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
	
	var state_body: CharacterBody2D = (owner as StateMachine).player
	if !state_body:
		return
	
	var direction := Input.get_vector("walk_left", "walk_right", "walk_up", "walk_down")
	if direction:
		var char_speed = move_toward(state_body.velocity.length(), SPEED, ACCEL)
		state_body.velocity = direction.normalized() * char_speed
		
		# ray_cast_2d.target_position = direction * ray_distance
		_change_direction(state_body)
	else:
		var char_speed = move_toward(state_body.velocity.length(), 0, ACCEL)
		state_body.velocity = state_body.velocity * char_speed
		if state_body.velocity == Vector2.ZERO:
			transition.emit("idle")
	state_body.move_and_slide()

func _change_direction(body: CharacterBody2D):
	var last_direction = owner.current_direction
	if body.velocity.x > 0:
		owner.current_direction = "right"
	if body.velocity.x < 0:
		owner.current_direction = "left"
	if body.velocity.y > 0:
		owner.current_direction = "down"
	if body.velocity.y < 0:
		owner.current_direction = "up"
	if last_direction != owner.current_direction:
		animation.play("walk_%s" % owner.current_direction)

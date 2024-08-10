extends CharacterBody2D
@export var ray_distance: int = 20
const SPEED = 100.0
@onready var ray_cast_2d: RayCast2D = $RayCast2D

func _physics_process(delta: float) -> void:
	pass
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_vector("walk_left", "walk_right", "walk_up", "walk_down")
	#ray_cast_2d.target_position = ray_distance * velocity.normalized()
	

	

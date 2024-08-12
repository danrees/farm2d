class_name HurtBox extends Area2D

@export var damage: int
@export var target_distance: float = 10


func _ready() -> void:
	monitorable = false

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("action"):
		print_debug("action")
		var areas = get_overlapping_areas()
		for a in areas:
			print_debug("area")
			if a is HitBox:
				a.take_damage(damage)
				print_debug("damage %d, remaining health %d" % [damage,a.current_health] )

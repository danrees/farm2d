class_name HurtBox extends Area2D

@export var damage: int
@export var target_distance: float = 10


func _ready() -> void:
	monitorable = false

func _physics_process(delta: float) -> void:
	#var parent = get_parent()
	#if parent is CharacterBody2D:
		#if parent.velocity != Vector2.ZERO:
			## target_position = parent.velocity.normalized() * target_distance
			#pass
	if Input.is_action_just_pressed("action"):
		print_debug("action")
		var areas = get_overlapping_areas()
		for a in areas:
			print_debug("area")
			if a is HitBox:
				a.take_damage(damage)
				print_debug("damage %d, remaining health %d" % [damage,a.current_health] )
		# damage occurs from the hitbox side
		#for i in get_collision_count():
			#var target = get_collider(i)
			#
			#if target is HitBox:
				#target.take_damage(damage)

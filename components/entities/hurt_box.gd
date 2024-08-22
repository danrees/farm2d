class_name HurtBox extends Area2D

# @export var damage: int
@export var target_distance: float = 10
@export var affects: Dictionary = {}


func _ready() -> void:
	monitorable = false

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("action"):
		print_debug("action")
		var areas = get_overlapping_areas()
		for a in areas:
			print_debug("area")
			if a is HitBox:
				# TODO: if there are multiple groups/affects this might be non-deterministic
				for group in a.get_groups():
					var dmg = affects[group]
					if dmg and dmg is int:
						a.take_damage(dmg)
						print_debug("damage %d, remaining health %d" % [dmg,a.current_health] )
						break

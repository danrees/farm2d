class_name HitBox extends Area2D

@export var max_health: int = 10

signal empty_health()

var current_health: int = 0

func _ready() -> void:
	current_health = max_health

func take_damage(dmg: int) -> void:
	current_health -= dmg
	if current_health <= 0:
		empty_health.emit()

func heal(hl: int) -> void:
	current_health = clampi(current_health + hl, 0, max_health)

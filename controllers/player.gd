extends CharacterBody2D
const SPEED = 100.0

@export var menu_target: Control
@onready var player_menu: Menu = $PlayerMenu

func _ready() -> void:
	player_menu.target = menu_target

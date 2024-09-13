extends Node

@export var inventory_manager: Inventory
@export var inventory_menu: PackedScene
@export var menu_target: Control

var menu: Menu
var is_open: bool = false

func _init_menu() -> void:
	menu = inventory_menu.instantiate() as Menu
	menu.target = menu_target
	
func _input(event: InputEvent) -> void:
	if event.is_action_released("inventory") and !is_open:
		if !menu:
			_init_menu()
		menu.open()
		is_open = true
	elif event.is_action_released("inventory") and is_open:
		menu.close()
		is_open = false

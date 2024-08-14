class_name InventoryManager extends Node

@export var menu_target: Control
@onready var inventory: Inventory = $Inventory
@export var inventory_menu: PackedScene

var is_open: bool = false
var menu: Menu

func _init_menu() -> void:
	menu = inventory_menu.instantiate()
	menu.target = menu_target

func _ready() -> void:
	_init_menu()
	
func _input(event: InputEvent) -> void:
	if event.is_action_released("inventory") and !is_open:
		if !menu:
			_init_menu()
		menu.open()
		is_open = true
	elif event.is_action_released("inventory") and is_open:
		menu.close()
		is_open = false

func _on_pickup_manager_picked_up(item: Item) -> void:
	inventory.add_item(item)

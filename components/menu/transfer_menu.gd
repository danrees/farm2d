class_name TransferMenu extends Menu

@export var inventory1: InventoryManager
@export var inventory2: InventoryManager

@onready var menus: HBoxContainer = $Menus


func _ready() -> void:
	var menu1 = inventory1.inventory_menu.instantiate()
	menus.add_child(menu1)
	menu1.owner = self
	var menu2 = inventory2.inventory_menu.instantiate()
	menus.add_child(menu2)
	menu2.owner = self

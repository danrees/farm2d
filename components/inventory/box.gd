class_name Box extends StaticBody2D

@export var inventory: InventoryManager

func _open() -> Menu:
	var menu = inventory.inventory_menu.instantiate() as Menu
	return menu

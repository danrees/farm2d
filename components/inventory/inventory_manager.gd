class_name InventoryManager extends Node

@onready var inventory_ui: Control = %InventoryUI
@onready var inventory_grid: InventoryGrid = $InventoryUI/CenterContainer/InventoryGrid
@onready var inventory: Inventory = $Inventory

func _input(event: InputEvent) -> void:
	if event.is_action_released("inventory"):
		inventory_ui.visible = !inventory_ui.visible

func _on_pickup_manager_picked_up(item: Item) -> void:
	inventory_grid.add_item(item)

class_name InventoryManager extends Node

@onready var inventory_ui: Control = %InventoryUI

func _input(event: InputEvent) -> void:
	if event.is_action_released("inventory"):
		inventory_ui.visible = !inventory_ui.visible

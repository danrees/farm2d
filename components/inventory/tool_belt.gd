class_name ToolBelt extends Control

@onready var slots: HBoxContainer = %Slots

@export var inventory: Inventory
@export var num_slots: int = 10

const ITEM_SLOT = preload("res://components/inventory/item_slot.tscn")

func _ready() -> void:
	refresh()

func refresh() -> void:
	for child in slots.get_children():
		child.queue_free()
	for i in num_slots:
		slots.add_child(ITEM_SLOT.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE))
	if inventory and inventory.items.size() > 0:
		for i in inventory.inventory.items.size():
			(get_child(i) as ItemSlot).add(inventory.inventory.items[i])

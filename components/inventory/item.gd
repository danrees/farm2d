class_name Item extends Resource

@export var name: String
@export var description: String
@export var icon: Texture2D
@export var collectible: PackedScene
@export var stackable: bool = true

const ITEM_SLOT = preload("res://components/inventory/item_slot.tscn")

func create_slot() -> ItemSlot:
	var slot = ITEM_SLOT.instantiate() as ItemSlot
	slot.add(self)
	return slot
	

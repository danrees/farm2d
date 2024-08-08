class_name ResourceNode extends StaticBody2D

@onready var contents: Contents = $Contents
signal drop_contents(collectible: Collectible, quantity: int)

func _ready() -> void:
	for child in get_children():
		if child is HitBox:
			child.empty_health.connect(drop_items)
			

func drop_items() -> void:
	if !contents:
		return
	var items = contents.drop_contents()
	for item in items:
		var quantity = 1
		if item is ItemStack:
			quantity = item.quantity
		elif item is Item:
			drop_contents.emit(Collectible.from_item(item), quantity)

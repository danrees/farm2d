class_name ResourceNode extends StaticBody2D

var contents: Contents

func _ready() -> void:
	for child in get_children():
		if child is HitBox:
			child.empty_health.connect(drop_items)
		if child is Contents:
			contents = child
			
func drop_items() -> void:
	if !contents:
		return
	var items = contents.drop_contents()
	for item in items:
		var quantity = 1
		if item is ItemStack:
			quantity = item.quantity
		# drop_contents.emit(Collectible.from_item(item), quantity)
		var parent = get_parent()
		var col = Collectible.from_item(item)
		col.drop_to(parent, position)
	# some sort of animation perhaps
	queue_free()

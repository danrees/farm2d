class_name Inventory extends Node

@export var items: Array[Item] = []
@export var max_size: int = 1

func add_item(item: Item) -> Item:
	if item is ItemStack:
		for i in items:
			if i is ItemStack:
				var remainder = i.stack(item)
				if remainder:
					if items.size() < max_size:
						items.push_back(remainder)
					else:
						return remainder as Item
	elif items.size() >= max_size:
		return item
	else:
		items.push_back(item)
	return null

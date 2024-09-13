class_name Inventory extends Node

@export var items: Array[ItemStack] = []
@export var max_size: int = 1


func add_item(item: ItemStack) -> ItemStack:
	if items.size() >= max_size:
		return item
	var matching_items: Array[ItemStack] = items.filter(func (it: ItemStack) -> bool:
		return item.item.name == it.item.name
		)
	if matching_items.size() == 0:
		items.push_back(item)
	else:
		for i in matching_items:
			var remainder = i.stack(item)
			if remainder:
				if items.size() < max_size:
					items.push_back(remainder)
				else:
					return remainder
	return null

func add_item_at(item: ItemStack, index: int) -> ItemStack:
	if items.size() < index:
		items.resize(index + 1)
	var existing_item = items[index]
	if !existing_item:
		items[index] = item
		return null
	if existing_item is ItemStack:
		var stacked = existing_item.stack(item)
		return stacked
	return existing_item

func drop_item_at(index: int) -> ItemStack:
	if index > items.size():
		return null
	var item = items[index]
	items[index] = null
	return item

func drop_all() -> Array[ItemStack]:
	var current_inventory = items.duplicate()
	items.clear()
	return current_inventory
		

func sort() -> void:
	pass

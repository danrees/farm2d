class_name ItemStack extends Resource

@export var quantity: int
@export var max_stack_size: int
@export var item: Item

const ITEM_SLOT = preload("res://components/inventory/item_slot.tscn")


func stack(item: ItemStack) -> ItemStack:
	quantity += item.quantity
	if quantity > max_stack_size:
		var old_quantity = quantity
		quantity = max_stack_size
		var new_quantity = old_quantity - max_stack_size
		var new_stack = self.duplicate() as ItemStack
		new_stack.quantity = new_quantity
		return new_stack
	return null
		
func create_slot() -> ItemSlot:
	var slot = ITEM_SLOT.instantiate() as ItemSlot
	slot.add(self)
	return slot

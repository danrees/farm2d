class_name ItemSlot extends Control
@onready var item_icon: TextureRect = $Button/ItemIcon
@onready var item_quantity: Label = $Button/ItemQuantity

signal swap_item(item: Item, index: int)

@export var index: int = 0
@export var item: Item

func _ready() -> void:
	if item:
		item_icon.texture = item.icon
		if item is ItemStack:
			item_quantity.text = str((item as ItemStack).quantity)

func add(item: Item)->void:
	if !item:
		item_icon.texture = null
		item_quantity.text = ""
		return
	item_icon.texture = item.icon
	if item is ItemStack:
		item_quantity.text = str((item as ItemStack).quantity)
	else:
		item_quantity.text = ""

func clear():
	item = null
	
func make_drag_preview() -> Control:
	return self.duplicate(DUPLICATE_USE_INSTANTIATION)
	
func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return data is SlotData

func _drop_data(at_position: Vector2, data: Variant) -> void:
	var drop_data = data as SlotData
	var swap_item = self.item
	self.item = drop_data.item
	swap_item.emit(swap_item, drop_data.slot_index)

func _get_drag_data(at_position: Vector2) -> Variant:
	var data = SlotData.new()
	data.item = self.item
	data.slot_index = self.index
	set_drag_preview(make_drag_preview())
	return data

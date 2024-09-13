class_name ItemSlot extends Control
@onready var item_icon: TextureRect = $Button/MarginContainer/ItemIcon
@onready var item_quantity: Label = $Button/MarginContainer/ItemQuantity

signal swap_item(item: Item, index: int)
signal select(item: Item, index: int)

@export var index: int = 0
@export var item: Item

func _ready() -> void:
	if item:
		item_icon.texture = item.icon
		if item is ItemStack:
			item_quantity.text = str((item as ItemStack).quantity)
	
	item_quantity.label_settings.font_size = size.y / 3

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
	if data is SlotData:
		var swap_item = self.item
		self.item = data.item
		swap_item.emit(swap_item, data.slot_index)

func _get_drag_data(at_position: Vector2) -> Variant:
	var data = SlotData.new()
	data.item = self.item
	data.slot_index = self.index
	set_drag_preview(make_drag_preview())
	return data


func _on_button_pressed() -> void:
	pass # Replace with function body.

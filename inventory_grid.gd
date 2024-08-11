class_name InventoryGrid extends GridContainer

@export var inventory_columns: int:
	set(value):
		self.columns = value
		inventory_columns = value
@export var inventory_rows: int

signal inventory_full()
signal drop_item_signal(item: Item)

const ITEM_SLOT = preload("res://components/inventory/item_slot.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	columns = inventory_columns
	for i in inventory_columns * inventory_rows:
		var slot = ITEM_SLOT.instantiate()
		slot.index = i
		add_child(slot)
		slot.swap_item.connect(swap_item)
	var test_item = preload("res://assets/sprites/items/wood.tres")
	var test_stack = ItemStack.new()
	test_stack.quantity = 5
	test_stack.icon = test_item.icon
	test_stack.collectible = test_item.collectible
	
	
	add_item(test_stack)

func is_full() -> bool:
	return get_child_count() < (inventory_columns * inventory_rows)

func add_item(item: Item) -> void:
	for child in get_children():
		var slot = child as ItemSlot
		if !slot.item:
			slot.add(item)
			return
	# if we have no where to put it, drop it again
	inventory_full.emit()

func add_item_at(item: Item, index: int) -> void:
	var slot = get_child(index) as ItemSlot
	if !slot.item:
		slot.add(item)
	else:
		var swap_item = slot.item
		slot.add(item)
		add_item(swap_item)
	# need to do something if something is already in that slot

func drop_item(index: int) -> void:
	var slot = get_child(index) as ItemSlot
	var item = slot.item
	slot.clear()
	# emit into world?
	drop_item_signal.emit(item)

func swap_item(item: Item, index: int):
	var slot = get_child(index) as ItemSlot
	slot.item = item

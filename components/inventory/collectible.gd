class_name Collectible extends RigidBody2D

@export var item: Item
const COLLISION_ZERO := 0b0
const COLLISION_COLLECTIBLE := 0b10

func from_item(item: Item) -> Collectible:
	var c = item.collectible.instantiate()
	c.item = item
	return c

func pick_up() -> void:
	# potentially do an animation?
	queue_free()

func drop() -> void:
	# prevent this from being picked up for a bit
	collision_layer = COLLISION_ZERO
	collision_mask = COLLISION_ZERO
	await get_tree().create_timer(5)
	collision_layer = COLLISION_COLLECTIBLE
	collision_mask = COLLISION_COLLECTIBLE

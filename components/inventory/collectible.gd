class_name Collectible extends RigidBody2D

@export var item: ItemStack
const COLLISION_ZERO := 0b0
const COLLISION_COLLECTIBLE := 0b10

static func from_item(item: Item) -> Collectible:
	if item.collectible == null:
		return null
	var c = item.collectible.instantiate()
	c.item = item
	return c

func pick_up() -> void:
	# potentially do an animation?
	if !item.collectible:
		get_parent().remove_child(self)
		var scene = PackedScene.new()
		scene.pack(self)
		item.collectible = scene
	

func drop_to(target: Node2D, position: Vector2) -> void:
	target.add_child(self)
	self.position = position
	# prevent this from being picked up for a bit
	collision_layer = COLLISION_ZERO
	collision_mask = COLLISION_ZERO
	apply_central_impulse(Vector2(randf_range(0.1, 1.0), randf_range(0.1, 1.0)) * 10)
	await get_tree().create_timer(5)
	collision_layer = COLLISION_COLLECTIBLE
	collision_mask = COLLISION_COLLECTIBLE

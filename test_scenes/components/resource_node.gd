class_name ResourceNode extends StaticBody2D

@export var destroy_animation: String
@export var atlas_coord: int = 0
@onready var sprite_2d: Sprite2D = $Sprite2D

var contents: Contents
var animation: AnimationPlayer

func _ready() -> void:
	sprite_2d.frame = atlas_coord
	for child in get_children():
		if child is HitBox:
			child.empty_health.connect(drop_items)
		if child is Contents:
			contents = child
		if child is AnimationPlayer:
			animation = child
			
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
	if animation:
		animation.play(destroy_animation)
		await animation.animation_finished
	queue_free()

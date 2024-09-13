class_name ResourceNode extends StaticBody2D

@export var destroy_animation: String = "destroy"
@export var atlas_coord: int = 0
@onready var sprite_2d: Sprite2D = $Sprite2D

var contents: Inventory
var animation: AnimationPlayer

func _ready() -> void:
	sprite_2d.frame = atlas_coord
	for child in get_children():
		if child is HitBox:
			child.empty_health.connect(drop_items)
		if child is Inventory:
			contents = child
		if child is AnimationPlayer:
			animation = child
			
func drop_items() -> void:
	if !contents:
		return
	var items = contents.drop_all()
	for item in items:
		# drop_contents.emit(Collectible.from_item(item), quantity)
		var parent = get_parent()
		var col = Collectible.from_item(item)
		col.drop_to(parent, position)
	# some sort of animation perhaps
	if animation and destroy_animation:
		animation.play(destroy_animation)
		await animation.animation_finished

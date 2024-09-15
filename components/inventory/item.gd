class_name Item extends Resource

@export var name: String
@export var description: String
@export var icon: Texture2D
@export var collectible: PackedScene
@export var equiped: PackedScene
@export var stackable: bool = true




func equip() -> Equipment:
	if equiped:
		return equiped.instantiate() as Equipment
	else:
		return null

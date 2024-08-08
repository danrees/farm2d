class_name Contents extends Node

@export var items: Array[ItemStack]
	
func drop_contents() -> Array[ItemStack]:
	return items

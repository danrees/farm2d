class_name InteractionManager extends Node

func interact() -> void:
	for child in get_children():
		if child is Action:
			child._interact()

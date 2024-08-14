class_name Menu extends Control

@export var target: Control

func open() -> void:
	# recursively open any child menus
	for child in get_children():
		if child is Menu:
			child.open()
	# finally open this one
	target.add_child(self)


# This should be bound to a button signal most likely
func close() -> void:
	queue_free()

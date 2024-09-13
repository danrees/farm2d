class_name Menu extends Control

@export var target: Control

@export var menu_container: Control = null

func open() -> void:
	# recursively open any child menus
	var child_menus = null
	if menu_container:
		child_menus = menu_container.get_children()
	else:
		child_menus = get_children()
			
	for child in child_menus:
		if child is Menu:
			child.open()
	# finally open this one
	target.add_child(self)


# This should be bound to a button signal most likely
func close() -> void:
	queue_free()

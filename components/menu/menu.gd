class_name Menu extends Control

@export var target: Control

func open() -> void:
	target.add_child(self)

# This should be bound to a button signal most likely
func close() -> void:
	queue_free()

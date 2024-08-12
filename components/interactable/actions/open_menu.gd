class_name OpenMenu extends Action

@export var menu: Menu

func _interact() -> void:
	menu.open()

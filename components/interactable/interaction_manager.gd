class_name InteractionManager extends Node

@export var default_tool: Tool
@export var ray_cast: RayCast2D

var current_tool: Tool

func equip(new_tool: Tool) -> void:
	if current_tool:
		current_tool._exit()
		get_node(get_path_to(current_tool)).queue_free()
	current_tool = new_tool
	new_tool._enter()
	add_child(new_tool)

func interact() -> void:
	if !current_tool:
		current_tool = default_tool
	current_tool._use()
	var target = ray_cast.get_collider()
	if !target:
		return
	if target is Interactable:
		target._interact(current_tool)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("action"):
		interact()

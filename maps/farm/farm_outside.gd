extends Node2D

@onready var layers: Layers = $Layers

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("left_click"):
		var mouse_at = get_global_mouse_position()
		var local_coords = to_local(mouse_at)
		layers.till_soil([layers.tile_coords(local_coords)])

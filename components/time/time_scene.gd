extends Node
@onready var time_controller: TimeController = $TimeController
@onready var time_hud: TimeHUD = $TimeHUD

func _process(delta: float) -> void:
	time_hud.set_display(time_controller.time)

extends Node
@onready var time_controller: Node2D = $TimeController
@onready var time_hud: TimeHUD = $TimeHUD

@export var secs_per_tick: int = 10
@export var game_secs_per_tick: int = 600
@export var clock_start_secs: int = 6 * 60 *60
@export var clock_day_end_secs: int = 26 * 60 * 60

#func _process(delta: float) -> void:
	#time_hud.set_display(time_controller.time)
func _ready() -> void:
	time_controller.clock.secs_per_tick = secs_per_tick
	time_controller.clock.game_secs_per_tick = game_secs_per_tick
	time_controller.clock.clock_start_secs = clock_start_secs
	time_controller.clock.clock_day_end_secs = clock_day_end_secs
	

func _on_time_controller_time_changed(hour: int, minute: int) -> void:
	time_hud.set_time(hour, minute)

func _on_time_controller_date_changed(day_of_month: int, day_of_week: String, month: String) -> void:
	time_hud.set_date(day_of_month, day_of_week, month)

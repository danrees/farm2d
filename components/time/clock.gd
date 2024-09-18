class_name Clock extends Node

@export var secs_per_tick: int = 10
@export var game_secs_per_tick: int = 600
@export var clock_start_secs: int = 6 * 60 *60
@export var clock_day_end_secs: int = 26 * 60 * 60

signal tick(elapsed_seconds: int)

var timer: Timer
var day_elapsed_seconds: int = 0

func _ready() -> void:
	timer = Timer.new()
	add_child(timer)
	timer.timeout.connect(_on_tick)

func _start() -> void:
	day_elapsed_seconds = clock_start_secs
	timer.start(secs_per_tick)

func _toggle_pause() -> bool:
	timer.paused = !timer.paused
	return timer.paused

func _on_tick() -> void:
	day_elapsed_seconds += game_secs_per_tick
	tick.emit(day_elapsed_seconds)

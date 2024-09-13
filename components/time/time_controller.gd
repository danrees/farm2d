class_name TimeController extends Node

@export var time: DateTime
@export var time_scale: int = 1

@onready var day_light: DayLight = $DayLight

signal time_event(time: DateTime)

var elapsed_seconds: float = 0

func _process(delta: float) -> void:
	elapsed_seconds += (delta * time_scale)
	if elapsed_seconds > 1:
		time._increase_seconds(elapsed_seconds as int)
		elapsed_seconds = fmod(elapsed_seconds,1)
		# print_debug(elapsed_seconds)
		day_light.next(time)
		time_event.emit(time)

extends Node

@onready var clock: Clock = $Clock
@onready var calendar: Calendar = $Calendar

signal paused(is_paused: bool)
signal started(time: int)

signal time_changed(hour: int, minute: int)
signal date_changed(day_of_month: int, day_of_week: String, month: String)

func _start() -> void:
	started.emit(clock.day_elapsed_seconds)
	clock._start()
	calendar.calendar_start()

func toggle_pause() -> void:
	var is_paused = clock._toggle_pause()
	paused.emit(is_paused)

func _on_clock_tick(elapsed_seconds: int) -> void:
	var minutes = elapsed_seconds * 60
	time_changed.emit(minutes * 24, minutes)
	if elapsed_seconds == (24 * 60 * 60):
		calendar.new_day()

func _on_calendar_sig_new_day(day_number: int) -> void:
	date_changed.emit(calendar._day_of_month(), calendar._day_of_week_name(), calendar._month_name())

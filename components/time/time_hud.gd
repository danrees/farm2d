class_name TimeHUD extends CanvasLayer

@onready var display: Label = $PanelContainer/Display
const date_format = "Day %d -> %02d:%02d"

func set_display(time: DateTime) -> void:
	var existing_date = display.text
	var new_date = date_format % [time.days, time.hours, time.minutes]
	if new_date != existing_date:
		display.text = new_date

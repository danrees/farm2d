class_name TimeHUD extends CanvasLayer

@onready var display: Label = $PanelContainer/VBoxContainer/DateLabel
@onready var time_label: Label = $PanelContainer/VBoxContainer/TimeLabel

const date_format = "Day %d -> %02d:%02d"

func set_time(hours: int, minutes: int) -> void:
	var time = "%02d:%02d"
	time_label.text = time % [hours, minutes]

func set_date(day_of_month: int, day_of_week: String, month: String) -> void:
	var date = "%s\n%s %d"
	display.text = date % [month, day_of_week, day_of_month]

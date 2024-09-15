class_name DateTime extends Resource

@export_range(0,59) var seconds: int = 0
@export_range(0,59) var minutes: int = 0
@export_range(0,23) var hours: int = 0
@export var days: int = 0

func _increase_seconds(delta_seconds: int) -> void:
	seconds += delta_seconds
	minutes += seconds / 60
	hours += minutes / 60
	days += hours / 24
	
	seconds = seconds % 60
	minutes = minutes % 60
	hours = hours % 24
	
func _before(compare: DateTime) -> bool:
	return hours > compare.hours || minutes > compare.minutes || seconds > compare.seconds
	

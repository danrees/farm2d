class_name Calendar extends Node

const WEEKS_PER_MONTH = 4

const SEASON_NAMES = ["Spring", "Summer", "Fall", "Winter"]
#enum SEASONS {SPRING, SUMMER, FALL, WINTER}

const DAY_NAMES = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
#enum WEEK_DAYS  {SUNDAY, MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY}

signal sig_new_day(day_number: int)
var elapsed_game_days: int = 0

#var current_month: SEASONS = SEASONS.SPRING
#var current_day: WEEK_DAYS = WEEK_DAYS.SUNDAY
func calendar_start(starting_day: int = 1) -> void:
	elapsed_game_days = starting_day

func _day_of_week_name() -> String:
	var day = elapsed_game_days % DAY_NAMES.size()
	return DAY_NAMES[day]

func _month_name() -> String:
	var month = elapsed_game_days % (WEEKS_PER_MONTH * SEASON_NAMES.size())
	return SEASON_NAMES[month]

func _day_of_month() -> int:
	var day = elapsed_game_days % (WEEKS_PER_MONTH * DAY_NAMES.size())
	return DAY_NAMES[day]

func new_day() -> void:
	# Increase overall elapsed time
	elapsed_game_days += 1
	sig_new_day.emit(elapsed_game_days)

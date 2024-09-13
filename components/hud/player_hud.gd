class_name PlayerHud extends CanvasLayer

@export var inventory: InventoryManager
@export var clock: TimeController
@onready var tool_belt: ToolBelt = %ToolBelt
@onready var time_display: Label = %TimeDisplay

const date_format = "Day %d -> %02d:%02d"

func _ready() -> void:
	tool_belt.inventory = inventory

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update(clock.time)

func update(time: DateTime) -> void:
	var existing_time = time_display.text
	var new_time = date_format % [time.days, time.hours, time.minutes]
	if new_time != existing_time or existing_time == "":
		time_display.text = new_time


func _on_pause_toggled(toggled_on: bool) -> void:
	get_tree().paused = toggled_on

class_name DayLight extends CanvasModulate

@export var transitions: Array[TimeOfDay] = []

signal finished()

func next(time: DateTime) -> void:
	if transitions.size() > 0 and transitions.front() and transitions.front().transition_at.after(time):
		var next_transition = transitions.pop_front()
		if next_transition:
			_transition(next_transition.transition_to, next_transition.transition_time)

func _transition(new_color: Color, duration: int) -> void:
	var p = create_tween().tween_property(self, "color", new_color, duration)
	p.finished.connect(_finished)
	
func _finished() -> void:
	finished.emit()

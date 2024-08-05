class_name Seed extends Node2D

@export var plant_stages: Array[PlantStage] = []

var age: int = 0

var current_stage: PlantStage
var current_stage_index: int = 0
var seed_path: String = ""

func _ready() -> void:
	if plant_stages.size() < 1:
		return
	var new_stage = plant_stages[0]
	if new_stage.trigger_age == 0:
		var seed = new_stage.on_screen.instantiate() as Node2D
		seed.add_to_group("plant")
		add_child(seed)
		seed_path = get_path_to(seed)
		current_stage = new_stage

func interact() -> void:
	current_stage.interact()

func grow(days: int) -> void:
	age += days
	for stage in plant_stages:
		if stage.trigger_age == age:
			var new_stage = stage.on_screen.instantiate()
			add_child(new_stage)
			seed_path = get_path_to(new_stage)
			if current_stage_index < plant_stages.size():
				current_stage_index += 1
				current_stage = plant_stages[current_stage_index]

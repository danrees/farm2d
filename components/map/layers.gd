class_name Layers extends Node2D

const TERRAIN_SET = 0

const TILLABLE = "tillable"
const WATERABLE = "waterable"
const PLANTABLE = "plantable"

const DIRT = 2
const SOIL = 3
const WET_SOIL = 0
const SEEDS = 0


@onready var terrain: TileMapLayer = $Terrain
@onready var watered: TileMapLayer = $Watered
@onready var planted: TileMapLayer = $Planted

func _check_property(prop: String, coords: Vector2i) -> bool:
	var td = terrain.get_cell_tile_data(coords)
	return td.get_custom_data(prop) as bool

func _find_type(prop: String, coords: Array[Vector2i]) -> Array[Vector2i]:
	var to_return: Array[Vector2i] = []
	for coord in coords:
		if _check_property(prop, coord):
			to_return.push_back(coord)
	return to_return
	
func tile_coords(local_coords: Vector2) -> Vector2i:
	return terrain.local_to_map(local_coords)
			
func till_soil(coords: Array[Vector2i]) -> void:
	var to_till = _find_type(TILLABLE, coords)
	terrain.set_cells_terrain_connect(to_till, TERRAIN_SET, SOIL )
	
func water_seed(coords: Array[Vector2i]) -> void:
	var to_water = _find_type(WATERABLE, coords)
	planted.set_cells_terrain_connect(to_water, TERRAIN_SET, WET_SOIL)
	
func plant_seed(coords: Array[Vector2i]) -> void:
	var to_plant = _find_type(PLANTABLE, coords)
	planted.set_cells_terrain_connect(to_plant, TERRAIN_SET, SEEDS)
	

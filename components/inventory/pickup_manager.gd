class_name PickupManager extends Node2D

@onready var magnet_radius: Area2D = $MagnetRadius
@onready var collect_radius: Area2D = $CollectRadius

@export var magnet_strength: int = 10

signal picked_up(item: ItemStack)
# while there is a collectibe item inside the magnetic
# zone, this will pull it towards the pickup manager
# node2d
func _physics_process(delta: float) -> void:
	if magnet_radius.has_overlapping_bodies():
		for b in magnet_radius.get_overlapping_bodies():
			if b is Collectible:
				var c = b as Collectible
				c.apply_central_force((self.global_position - c.global_position) * magnet_strength)


func _on_collect_radius_body_entered(body: Node2D) -> void:
	if body is Collectible:
		var col = body as Collectible
		picked_up.emit(col.item)
		col.pick_up()
		picked_up.emit(col.item)

# This is to slow down/stop the item after it has left the
# magnetic zone
func _on_magnet_radius_body_exited(body: Node2D) -> void:
	if body is Collectible:
		var c = body as Collectible
		#c.apply_central_impulse(Vector2.ZERO)
		c.linear_velocity = Vector2.ZERO

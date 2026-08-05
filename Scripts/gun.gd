extends Node2D

var bullet_prefab = preload("res://Prefab/bullet.tscn")

var rotation_player: Vector2 = Vector2.from_angle(rotation)

func _on_timer_timeout() -> void:
	#spawn bullet
	var current_direction : Vector2 = Vector2.RIGHT.rotated(global_rotation)
	spawn_bullet(current_direction)

func spawn_bullet(direction : Vector2):
	#spawn a bullet
	var bullet = bullet_prefab.instantiate()
	bullet.position = global_position
	bullet.direction = direction
	bullet.global_rotation = global_transform.get_rotation()
	get_tree().root.add_child(bullet)

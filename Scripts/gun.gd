extends Node2D

var bullet_prefab = preload("res://Prefab/bullet.tscn")

var rotation_player: Vector2 = Vector2.from_angle(rotation)
var shootCooldown = 0

func _process(delta: float) -> void:
	if Input.is_action_pressed("shoot") and shootCooldown <= 0:
		var current_direction : Vector2 = Vector2.RIGHT.rotated(global_rotation)
		spawn_bullet(current_direction)
		shootCooldown = 0.1
	shootCooldown -= delta

#func _on_timer_timeout() -> void:
	#spawn bullet
	#var current_direction : Vector2 = Vector2.RIGHT.rotated(global_rotation)
	#spawn_bullet(current_direction)

func spawn_bullet(direction : Vector2):
	#spawn a bullet
	var bullet = bullet_prefab.instantiate()
	bullet.position = global_position
	bullet.direction = direction
	bullet.global_rotation = global_transform.get_rotation()
	get_tree().root.add_child(bullet)

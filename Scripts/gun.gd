extends Node2D

var bullet_prefab = preload("res://Prefab/bullet.tscn")

var rotation_player: Vector2 = Vector2.from_angle(rotation)
var shootCooldown = 0
var Team = "good"
@onready var enemy = $"../"

func _process(delta: float) -> void:
	pass
	
#taking in command from parents
func _shoot(delta: float):
		#var current_direction : Vector2 = Vector2.RIGHT.rotated(global_rotation)
		var current_direction : Vector2 = Vector2.RIGHT.rotated(global_rotation)
		
		spawn_bullet(current_direction)
		


#spawning bullet with correct position and rotation
func spawn_bullet(direction : Vector2):
	#spawn a bullet
	var bullet = bullet_prefab.instantiate()
	bullet.position = global_position
	bullet.direction = direction
	bullet.global_rotation = global_transform.get_rotation()
	bullet.Team = Team  #assigns the bullets team
	get_tree().root.add_child(bullet)

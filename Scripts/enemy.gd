extends CharacterBody2D

#set variable
var player: Node2D 
@export var speed: float = 120.0
@export var turn = 0.05
var cooldown = 0

@onready var sprite = $Sprite2D
@onready var hitbox = $CollisionPolygon2D
@onready var Area = $Area2D
@onready var gun = $gun


func _ready() -> void:
	# Look for the player
	if get_tree().has_group("player"):
		player = get_tree().get_first_node_in_group("player")

func _physics_process(delta: float) -> void:
	#please no crash mechinism
	if not player:
		return
#main process
func _process(delta: float) -> void:
	#cooldown for shooting
	if 0 < cooldown and cooldown < 11:
		cooldown -= 1
		print(cooldown)
	
	# rotate to player
	var speeen = lerp((player.global_position - global_position).angle() + (PI / 2),turn,0.01)
	sprite.global_rotation = speeen
	hitbox.global_rotation = speeen
	Area.global_rotation = speeen
	gun.global_rotation = speeen -PI/2 #I have to subtrace PI/2 to make the vector2 point the right way
	
	#check for player in detection zone
	var see = Area.get_overlapping_areas()
	for thing in see:
		if thing == player:
			if cooldown == 0:
				gun._shoot(delta)
				cooldown = 10
				print(cooldown)
	#chase player
	velocity = global_position.direction_to(player.global_position) * speed 
	move_and_slide()

	

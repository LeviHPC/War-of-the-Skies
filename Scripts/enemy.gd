extends CharacterBody2D
class_name enemy
#set variable
var player: Node2D 
@export var speed: float = 120.0
@export var turn = 0.025
var cooldown = 0
var Team = "bad"
var Health = 100

@onready var sprite = $Sprite2D
@onready var hitbox = $CollisionPolygon2D
@onready var Area = $Area2D
@onready var gun = $gun
@onready var bar = $AnimatedSprite2D


func _ready() -> void:
	# Look for the player
	if get_tree().has_group("player"):
		player = get_tree().get_first_node_in_group("player")

func _physics_process(delta: float) -> void:
	#please no crash mechinism
	if not player:
		return
#main process

func _on_player_game_over() -> void:
	self.queue_free()

func _process(delta: float) -> void:
	#cooldown for shooting
	if 0 < cooldown and cooldown < 11:
		cooldown -= 1
	
	# rotate to player
	
	var target_angle = (player.global_position - global_position).angle() + (PI / 2)
	
	var speeen = lerp_angle(sprite.global_rotation, target_angle, turn)# * delta)
	
	sprite.global_rotation = speeen
	hitbox.global_rotation = speeen
	Area.global_rotation = speeen
	gun.global_rotation = speeen -PI/2 #I have to subtrace PI/2 to make the vector2 point the right way
	
	#check for player in detection zone
	var see = Area.get_overlapping_areas()
	for thing in see:
		if thing == player:
			if cooldown == 0:
				gun.Team = Team
				gun._shoot(delta)
				cooldown = 10
	#chase player
	velocity = global_position.direction_to(player.global_position) * speed 
	move_and_slide()
	
	#Health Bar
	if Health > 99:
		bar.frame = 0
	elif Health > 79:
		bar.frame = 1
	elif Health > 59:
		bar.frame = 2
	elif Health > 39:
		bar.frame = 3
	elif Health > 19:
		bar.frame = 4
	elif Health <= 0:
		self.queue_free() 
		
	

extends CharacterBody2D

#set variable
var player: Node2D 
@export var speed: float = 120.0

@onready var sprite = $Sprite2D


func _ready() -> void:
	# Look for the player
	if get_tree().has_group("player"):
		player = get_tree().get_first_node_in_group("player")

func _physics_process(delta: float) -> void:
	#please no crash mechinism
	if not player:
		return

	# Chase Player
	sprite.global_rotation = (player.global_position - global_position).angle()
	
	velocity = global_position.direction_to(player.global_position) * speed
	move_and_slide()

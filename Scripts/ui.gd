extends Control

@onready var health_label = $Health
@onready var player = $"../../Player"
@onready var bar = $AnimatedSprite2D
@onready var game_over = $Sprite2D
var fade = 0
var dead = false

 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if dead == false:
		
		health_label.text = str(player.Health)
		
		#Health Bar
		
		if player.Health > 99:
			bar.frame = 0
		elif player.Health > 84:
			bar.frame = 1
		elif player.Health > 69:
			bar.frame = 2
		elif player.Health > 54:
			bar.frame = 3
		elif player.Health > 39:
			bar.frame = 4
		elif player.Health > 24:
			bar.frame = 5
		game_over.modulate = Color(1,1,1,0)
	
	else:
		fade += delta
		game_over.modulate = Color(1,1,1,abs(fade-1))

func _on_player_game_over() -> void:
	dead = true
	
	

extends Camera2D

var dead = false
# Called every frame. 'delta' is the elapsed time since the previous frame.

@onready var player = $"../Player"



func _process(delta: float) -> void:
	if dead == false:
		global_position = player.global_position



func _on_player_game_over() -> void:
	dead = true	
	

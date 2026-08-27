extends Control

@onready var health_label = $Health
@onready var player = $"../../Player"
@onready var bar = $AnimatedSprite2D
 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
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

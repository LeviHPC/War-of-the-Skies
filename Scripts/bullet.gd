extends Area2D

#Setting Speed and Direction
var speed = 600
var direction : Vector2 = Vector2.ZERO


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.global_position += direction * speed * delta

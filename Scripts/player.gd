extends Area2D

#varibles
@export var speed = 300
@export var turn_speed = 5

#making the plane go infinitly forward
func _physics_process(delta: float) -> void:
	var forward_direction = Vector2.UP.rotated(rotation)
	position += forward_direction * speed * delta
	
	turn(delta)

#Making the plane turn
func turn(delta: float) -> void:
	if Input.is_action_pressed("Left"):
		rotate(-turn_speed * get_process_delta_time())
	if Input.is_action_pressed("Right"):
		rotate(turn_speed * get_process_delta_time())

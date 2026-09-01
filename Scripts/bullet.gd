extends Area2D

#Setting Speed and Direction
var speed = 600
var direction : Vector2 = Vector2.ZERO
var Team = "good"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.global_position += direction * speed * delta
	
	#finds what it hit
	var hit = get_overlapping_areas() + get_overlapping_bodies()
	
	#Indentifies it
	for thing in hit:
		if thing is player or thing is enemy:
			if not thing.Team == Team:
				thing.Health -= 5
				self.queue_free() #Deletes it self+
			else:
				pass

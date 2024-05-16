extends KinematicBody2D
onready var body = $CollisionShape2D

var velocity = Vector2( - 7000, 0)


func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision != null:
		if collision.collider.is_in_group("player"):
			GlobalVariables.health -= 100
			body.disabled = true
			

	


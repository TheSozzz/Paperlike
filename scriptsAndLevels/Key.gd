extends Node2D

onready var key = get_node(".")

func _ready():
	pass


func _on_keyArea_body_entered(body):
	if body.name == "picard":
		GlobalVariables.keyNum += 1
		key.queue_free()


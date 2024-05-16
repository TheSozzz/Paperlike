extends Node2D

onready var portal_B = get_node("../teleportB")

var pos_b

func _ready():
	pos_b = portal_B.get_global_position()

func _on_portalA_body_entered(body):
	if body.name == "picard" and GlobalVariables.teleported == false:
		body.set_position(pos_b)
	GlobalVariables.teleported = true


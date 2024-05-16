extends Node2D

export  var pathToPartner = "../teleportA1"

onready var portal_A = get_node(pathToPartner)

var pos_a

func _ready():
	pos_a = portal_A.get_global_position()

func _on_portalB_body_entered(body):
	if body.name == "picard" and GlobalVariables.teleported == false:
		body.set_position(pos_a)
		GlobalVariables.teleported = true

func _on_portalB_body_exited(body):
	GlobalVariables.teleported = false

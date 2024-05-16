extends Node2D

var blue_texture = preload("res://Characters/assets/blueDoor.PNG")
var blue_trapdoor = preload("res://Characters/assets/blueTrapDoor.PNG")
var green_texture = preload("res://Characters/assets/greenDoor.PNG")
var green_trapdoor = preload("res://Characters/assets/greenTrapDoor.PNG")
var purple_texture = preload("res://Characters/assets/purpleDoor.PNG")
var purple_trapdoor = preload("res://Characters/assets/purpleTrapDoor.PNG")
var black_texture = preload("res://Characters/assets/blackDoor.PNG")
var black_trapdoor = preload("res://Characters/assets/blackTrapDoor.PNG")

onready var door_collision = $StaticBody2D / CollisionShape2D
onready var sprite = $StaticBody2D / Sprite

func _process(delta):
	if GlobalVariables.scene == "blue":
		if rotation != 0:
			sprite.set_texture(blue_trapdoor)
		else :
			sprite.set_texture(blue_texture)
	elif GlobalVariables.scene == "green":
		if rotation != 0:
			sprite.set_texture(green_trapdoor)
		else :
			sprite.set_texture(green_texture)
	elif GlobalVariables.scene == "purple":
		if rotation != 0:
			sprite.set_texture(purple_trapdoor)
		else :
			sprite.set_texture(purple_texture)
	elif GlobalVariables.scene == "black":
		if rotation != 0:
			sprite.set_texture(black_trapdoor)
		else :
			sprite.set_texture(black_texture)
		
	check_to_open()

func check_to_open():
	if GlobalVariables.keyNum > 0 and door_collision.disabled != true:
		GlobalVariables.keyNum -= 1
		door_collision.disabled = true
			
		



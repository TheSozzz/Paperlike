extends Control


onready var scene_player = $AnimatedSprite
onready var display_text = $Label
var speech_arr = []
var index = - 1
var count = 1

func _ready():
	var f = File.new()
	f.open("res://slides2.txt", File.READ)
	while not f.eof_reached():
		speech_arr.append(f.get_line())
	f.close()
	
func _process(delta):
	if index == 26:
		GlobalVariables.sound_type = "cutscene"
	if index == - 1:
		scene_player.play("sc1")
	if Input.is_action_just_pressed("dialogueNext") and index < len(speech_arr) - 1:
		index += 1
	elif speech_arr[index] == "##":
		count += 1
		scene_player.play("sc" + str(count))
		index += 1
	if index != - 1:
		display_text.text = speech_arr[index]

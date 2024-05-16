extends TextureRect

onready var label = $Label
onready var box = get_node(".")
var speech_arr = []
var play_at_end = false
func _ready():
	var f = File.new()
	f.open("res://dialogues.txt", File.READ)
	while not f.eof_reached():
		speech_arr.append(f.get_line())
	f.close()
	
func _process(delta):
	visible = GlobalVariables.show_text
	if visible == true:
		get_tree().paused = true
		if GlobalVariables.speech_lines[GlobalVariables.index] == 371:
			play_at_end = true
		if Input.is_action_just_pressed("dialogueNext"):
			GlobalVariables.index += 1
		if Input.is_action_just_pressed("skipDialogue"):
			GlobalVariables.index = len(GlobalVariables.speech_lines) - 1
			if play_at_end == true:
				GlobalVariables.sound_type = "boss"
		if GlobalVariables.index == len(GlobalVariables.speech_lines) - 1:
			GlobalVariables.show_text = false
			visible = false
			GlobalVariables.dialogueDone = true
			GlobalVariables.index = 0
			get_tree().paused = false
			if play_at_end == true:
				GlobalVariables.sound_type = "boss"
		else :
			if speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][1] == "P":
				if speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][2] == "0":
					box.texture = load("res://Characters/assets/dialogueBoxes/picardBox0.png")
				if speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][2] == "1":
					box.texture = load("res://Characters/assets/dialogueBoxes/picardBox1.png")
				if speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][2] == "2":
					box.texture = load("res://Characters/assets/dialogueBoxes/picardBox2.png")
				if speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][2] == "3":
					box.texture = load("res://Characters/assets/dialogueBoxes/picardBox3.png")
				if speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][2] == "4":
					box.texture = load("res://Characters/assets/dialogueBoxes/picardBox4.png")
				if speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][2] == "5":
					box.texture = load("res://Characters/assets/dialogueBoxes/picardBox5.png")
				if speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][2] == "6":
					box.texture = load("res://Characters/assets/dialogueBoxes/picardBox6.png")
				if speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][2] == "7":
					box.texture = load("res://Characters/assets/dialogueBoxes/picardBox7.png")
				if speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][2] == "8":
					box.texture = load("res://Characters/assets/dialogueBoxes/picardBox8.png")
			elif speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][1] == "C":
				if speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][2] == "0":
					box.texture = load("res://Characters/assets/dialogueBoxes/curveBox0.png")
				if speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][2] == "1":
					box.texture = load("res://Characters/assets/dialogueBoxes/curveBox1.png")
				if speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][2] == "2":
					box.texture = load("res://Characters/assets/dialogueBoxes/curveBox2.png")
				if speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][2] == "3":
					box.texture = load("res://Characters/assets/dialogueBoxes/curveBox3.png")
				if speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][2] == "4":
					box.texture = load("res://Characters/assets/dialogueBoxes/curveBox4.png")
				if speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][2] == "5":
					box.texture = load("res://Characters/assets/dialogueBoxes/curveBox5.png")
				if speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][2] == "6":
					box.texture = load("res://Characters/assets/dialogueBoxes/curveBox6.png")
				if speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][2] == "7":
					box.texture = load("res://Characters/assets/dialogueBoxes/curveBox7.png")
				if speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][2] == "8":
					box.texture = load("res://Characters/assets/dialogueBoxes/curveBox8.png")
			elif speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][1] == "M":
				box.texture = load("res://Characters/assets/dialogueBoxes/mollyBox.png")
			elif speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][1] == "B":
				if speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][2] == "1":
					box.texture = load("res://Characters/assets/dialogueBoxes/billBox1.png")
				if speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][2] == "2":
					box.texture = load("res://Characters/assets/dialogueBoxes/billBox2.png")
				if speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][2] == "3":
					box.texture = load("res://Characters/assets/dialogueBoxes/billBox3.png")
			elif speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][1] == "A":
				box.texture = load("res://Characters/assets/dialogueBoxes/auntyMarthaBox.png")
			elif speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][1] == "D":
				if speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][2] == "1":
					box.texture = load("res://Characters/assets/dialogueBoxes/cityDwellerBox1.png")
				if speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][2] == "2":
					box.texture = load("res://Characters/assets/dialogueBoxes/cityDwellerBox2.png")
				if speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][2] == "3":
					box.texture = load("res://Characters/assets/dialogueBoxes/cityDwellerBox3.png")
				if speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][2] == "4":
					box.texture = load("res://Characters/assets/dialogueBoxes/cityDwellerBox4.png")
			elif speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][1] == "L":
				if speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][2] == "1":
					box.texture = load("res://Characters/assets/dialogueBoxes/alliceBox1.png")
				if speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][2] == "2":
					box.texture = load("res://Characters/assets/dialogueBoxes/alliceBox2.png")
				if speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][2] == "3":
					box.texture = load("res://Characters/assets/dialogueBoxes/alliceBox3.png")
				if speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][2] == "4":
					box.texture = load("res://Characters/assets/dialogueBoxes/alliceBox4.png")
				if speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][2] == "5":
					box.texture = load("res://Characters/assets/dialogueBoxes/alliceBox5.png")
			elif speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][1] == "G":
				box.texture = load("res://Characters/assets/dialogueBoxes/defaultBox.png")
			elif speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]][1] == "W":
				box.texture = load("res://Characters/assets/dialogueBoxes/windoBox.png")
			var count = 0
			var displayText = ""
			for y in speech_arr[GlobalVariables.speech_lines[GlobalVariables.index]]:
				if (count != 0) and (count != 1) and (count != 2) and (count != 3):
					displayText += y
				count += 1
			label.text = displayText

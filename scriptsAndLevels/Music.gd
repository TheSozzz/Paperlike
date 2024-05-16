extends Node2D
var player = AudioStreamPlayer.new()
var playerBoss = AudioStreamPlayer.new()
var playerCutscene = AudioStreamPlayer.new()

func _ready():
	self.add_child(player)
	self.add_child(playerBoss)
	self.add_child(playerCutscene)
	pause_mode = player.PAUSE_MODE_PROCESS
	pause_mode = playerBoss.PAUSE_MODE_PROCESS
	pause_mode = playerCutscene.PAUSE_MODE_PROCESS
	player.stream = load("res://Characters/assets/melody2.wav")
	playerBoss.stream = load("res://Characters/assets/music2.wav")
	playerCutscene.stream = load("res://Characters/assets/music3.wav")
	player.volume_db = - 15
	playerBoss.volume_db = - 15
	playerCutscene.volume_db = - 15
	
func _process(delta):
	if GlobalVariables.sound_type == "normal":
		if not player.is_playing():
			player.play()
			playerBoss.stop()
			playerCutscene.stop()
	elif GlobalVariables.sound_type == "boss":
		if not playerBoss.is_playing():
			playerBoss.play()
			player.stop()
			playerCutscene.stop()
	elif GlobalVariables.sound_type == "cutscene":
		if not playerCutscene.is_playing():
			playerCutscene.play()
			player.stop()
			playerBoss.stop()

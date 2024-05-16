extends Control

func _on_mainMenu_pressed():
	get_tree().change_scene("res://titleScreen.tscn")

func _on_fromCheckPoint_pressed():
	get_tree().change_scene(GlobalVariables.level_start_scene)
	GlobalVariables.health = 200
		
		
		
		

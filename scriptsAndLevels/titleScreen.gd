extends Control



func _on_newGame_pressed():
	yield (get_tree().create_timer(0.5), "timeout")
	get_tree().change_scene("res://INITanim.tscn")

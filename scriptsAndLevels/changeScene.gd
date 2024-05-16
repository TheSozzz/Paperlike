extends Control

signal scene_changed()

onready var animation_play = $AnimationPlayer
onready var black = $ColorRect

func _process(delta):
	if GlobalVariables.can_load == true:
		change_scene(0.5, GlobalVariables.path_to_load_scene)
		GlobalVariables.can_load = false
		
func change_scene(delay, path):
	yield (get_tree().create_timer(delay), "timeout")
	animation_play.play("fade")
	yield (animation_play, "animation_finished")
	get_tree().change_scene(path)
	animation_play.play_backwards("fade")
	

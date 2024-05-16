extends Node2D







func _ready():
	GlobalVariables.scene = "black"
	GlobalVariables.level_start_scene = "res://Dpurple1.tscn"
	if GlobalVariables.custom_checkpoint == true:
		$picard.global_position = $bossFightSpawn.global_position

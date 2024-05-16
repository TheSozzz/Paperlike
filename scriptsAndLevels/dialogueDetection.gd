extends Area2D

onready var collision_shape = $CollisionShape2D

export  var start = 0
export  var stop = 5
var array = []

func _ready():
	GlobalVariables.index = 0
	GlobalVariables.dialogueDone == false
	for x in range(start, stop + 1):
		array.append(x)


func _on_dialogueDetection_body_entered(body):
	if body.is_in_group("player"):
		GlobalVariables.speech_lines = array
		GlobalVariables.show_text = true

func _on_dialogueDetection_body_exited(body):
	GlobalVariables.dialogueDone == false
	queue_free()
	
	

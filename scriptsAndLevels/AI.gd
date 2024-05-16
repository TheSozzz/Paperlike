extends Node2D

signal state_changed(next_state)

var target = false
var in_field = false

onready var field_of_vision = $fieldOfVision
onready var bad_guy = get_node("../")

var possible_states = ["IDLE", "ATTACKING"]
var current_state = possible_states[0] setget set_state

func _physics_process(delta):
	if target:
		find_walls()
	else :
		set_state(possible_states[0])

func find_walls():
	var space_state = get_world_2d().direct_space_state
	var result = space_state.intersect_ray(bad_guy.position, target.position, [bad_guy])
	if result:
		if result.collider.is_in_group("player"):
			set_state(possible_states[1])
		elif result.collider.is_in_group("player"):
			set_state(possible_states[0])
		

func set_state(new_state):
	if new_state == current_state:
		return 
	current_state = new_state
	emit_signal("state_changed", current_state)


func _on_fieldOfVision_body_entered(body):
	if body.is_in_group("player"):
		target = body

func _on_fieldOfVision_body_exited(body):
	if body.is_in_group("player"):
		target = false
		
		

extends Area2D

onready var launch_top = $launchTop
onready var launch_bottom = $launchBottom

var fireball = preload("res://fireball.tscn")
var fire_ball
var start_fight = false
var health = 250
var global_fireball_num = 0
func _ready():
	start_fight = false
	var timer = Timer.new()
	timer.set_wait_time(2.0)
	timer.set_one_shot(false)
	timer.connect("timeout", self, "spawn_fireball")
	add_child(timer)
	timer.start()
	
func _process(delta):
	if global_fireball_num == 8:
		get_tree().change_scene("res://BOSSAnim.tscn")
		
func spawn_fireball():
	var random = RandomNumberGenerator.new()
	random.randomize()
	var rNum = random.randi_range(0, 1)
	if start_fight == true:
		if rNum == 0:
			global_fireball_num += 1
			fire_ball = fireball.instance()
			launch_top.add_child(fire_ball)
		elif rNum == 1:
			global_fireball_num += 1
			fire_ball = fireball.instance()
			launch_bottom.add_child(fire_ball)
	else :
		pass

func _on_fireball_detection_body_entered(body):
	if body.is_in_group("fireballs"):
		body.queue_free()


func _on_detectPicard_body_entered(body):
	if body.is_in_group("player"):
		start_fight = true

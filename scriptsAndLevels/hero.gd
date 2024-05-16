extends KinematicBody2D

var velocity = Vector2(0, 0)
const SPEED = 3500
var GRAVITY = GlobalVariables.gravity
const JUMPFORCE = - 7500
var can_stand = true
var input_there = false
var direction = "r"

onready var scene_change_trig = get_node("../sceneChangeTrigger")
onready var check_for_cieling = $checkForCieling
onready var standing_collision = $standingUpCollision
onready var crouching_collision = $crouchingCollision
onready var bad_guy = $"/root/baddude.tscn/badguy"
onready var big_jump = $big_jump
onready var animation = $AnimatedSprite
onready var health_bar = get_node("../HUD/TextureRect")
onready var camera = $Camera2D

func _ready():
	animation.play("idle")

func _process(delta):
	input_there = false
	if Input.is_action_pressed("crouch"):
		input_there = true
		animation.play("crouch")
		standing_collision.disabled = true
		crouching_collision.disabled = false
	elif can_stand == true:
		standing_collision.disabled = false
		crouching_collision.disabled = true
	
	if GlobalVariables.health == 200:
			health_bar.texture = load("res://Characters/assets/health4.png")
	elif GlobalVariables.health == 150:
		health_bar.texture = load("res://Characters/assets/health3.png")
	elif GlobalVariables.health == 100:
		health_bar.texture = load("res://Characters/assets/health2.png")
	elif GlobalVariables.health == 50:
		health_bar.texture = load("res://Characters/assets/health1.png")
	elif GlobalVariables.health == 0:
		health_bar.texture = load("res://Characters/assets/health0.png")
		
	if GlobalVariables.health <= 0:
		yield (get_tree().create_timer(1), "timeout")
		var enemy_list = get_tree().get_nodes_in_group("enemy")
		for baddy in enemy_list:
			baddy.queue_free()
		self.queue_free()
		get_tree().change_scene("res://deathScreen.tscn")
		
		

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		direction = "r"
		input_there = true
		if is_on_floor():
			animation.play("moveR")
		velocity.x = SPEED
	if Input.is_action_pressed("left"):
		direction = "l"
		input_there = true
		if is_on_floor():
			animation.play("moveL")
		velocity.x = - SPEED
	
	if Input.is_action_pressed("jump") and is_on_floor():
		input_there = true
		animation.play("jumping")
		velocity.y = JUMPFORCE
		
	if Input.is_action_just_pressed("bigJump") and is_on_floor():
		input_there = true
		if not Input.is_action_pressed("bigJump"):
			return 
		animation.play("smallCrouch")
		yield (get_tree().create_timer(1), "timeout")
		animation.play("superJumping")
		if not Input.is_action_pressed("bigJump"):
			return 
			
		velocity.y = JUMPFORCE * 1.6
	
		
	if Input.is_action_just_pressed("attack") and GlobalVariables.can_attack == true:
		input_there = true
		if direction == "l":
			animation.play("attackLeft")
		if direction == "r":
			animation.play("attackRight")
		melee_attack_enemy()
		
	if input_there == false and not Input.is_action_pressed("bigJump") and not Input.is_action_pressed("jump") and is_on_floor() == true:
		animation.play("idle")
	
	velocity.y = velocity.y + GRAVITY
	velocity = move_and_slide(velocity, Vector2.UP)
	velocity.x = lerp(velocity.x, 0, 0.25)


func _on_checkForCieling_body_entered(body):
	if body.is_in_group("tiles"):
		can_stand = false

func _on_checkForCieling_body_exited(body):
	if body.is_in_group("tiles"):
		can_stand = true


func _on_hitChecker_body_entered(body):
	if body.is_in_group("enemy"):
		GlobalVariables.health -= GlobalVariables.enemy_attack_strength
		
		
	
func melee_attack_enemy():
	GlobalVariables.targeted_enemy.health -= 60
	if GlobalVariables.targeted_enemy.health <= 0:
		GlobalVariables.targeted_enemy.queue_free()

func _on_attackRange_body_entered(body):
	if body.is_in_group("enemy"):
		GlobalVariables.can_attack = true
		GlobalVariables.targeted_enemy = body
		
func _on_attackRange_body_exited(body):
	if body.is_in_group("enemy"):
		GlobalVariables.can_attack = false
		GlobalVariables.targeted_enemy = null


func _on_sceneChangeTrigger_body_entered(body):
	if body.name == "picard":
		GlobalVariables.can_load = true


func _on_detectPicard_body_entered(body):
	if body.is_in_group("player"):
		GlobalVariables.custom_checkpoint = true
		camera.zoom.y = 14
		camera.zoom.x = 14
		camera.drag_margin_h_enabled = true
		camera.drag_margin_v_enabled = true
		camera.drag_margin_left = 13000
		camera.drag_margin_bottom = 99600

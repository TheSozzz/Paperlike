extends KinematicBody2D

export  var enemyType = 1

var velocity = Vector2(0, 0)
var GRAVITY = GlobalVariables.gravity
var JUMPFORCE = - 600
var health = 200

var idle_speed = 2000
var acceleration = 300
var angery_speed = 3200
var move_back = false
var state = "IDLE"
var og_pos
var bad_guy_img

onready var img_green = $SpriteGreen
onready var img_blue = $SpriteBlue
onready var img_purple = $SpritePurple
onready var img_black = $SpriteBlack
onready var bad_guy_fov = $AI / fieldOfVision / CollisionPolygon2D
onready var body_green = $CollShapeGreen
onready var body_blue = $CollShapeBlue
onready var body_purple = $CollShapePurple
onready var body_black = $CollShapeBlack
onready var bad_guy = get_node(".")
onready var good_guy = get_tree().get_nodes_in_group("player")


func _ready():
	og_pos = global_position
	get_node("AI").connect("state_changed", self, "_on_AI_state_changed")

func _process(delta):
	if GlobalVariables.scene == "green":
		body_green.disabled = false
		body_blue.disabled = true
		body_purple.disabled = true
		body_black.disabled = true
		
		img_green.visible = true
		img_blue.visible = false
		img_purple.visible = false
		img_black.visible = false
		img_green.set_texture(preload("res://Characters/assets/fox.png"))
		bad_guy_img = img_green
		
	elif GlobalVariables.scene == "blue":
		body_green.disabled = true
		body_blue.disabled = false
		body_purple.disabled = true
		body_black.disabled = true
		
		img_green.visible = false
		img_blue.visible = true
		img_purple.visible = false
		img_black.visible = false
		if enemyType == 1:
			img_blue.set_texture(preload("res://Characters/assets/blue1.png"))
		elif enemyType == 2:
			img_blue.set_texture(preload("res://Characters/assets/blue2.png"))
		bad_guy_img = img_blue
		
	elif GlobalVariables.scene == "purple":
		body_green.disabled = true
		body_blue.disabled = true
		body_purple.disabled = false
		body_black.disabled = true
		
		img_green.visible = false
		img_blue.visible = false
		img_purple.visible = true
		img_black.visible = false
		if enemyType == 1:
			img_purple.set_texture(preload("res://Characters/assets/purple1.png"))
		elif enemyType == 2:
			img_purple.set_texture(preload("res://Characters/assets/purple2.png"))
		bad_guy_img = img_purple
		
	elif GlobalVariables.scene == "black":
		body_green.disabled = true
		body_blue.disabled = true
		body_purple.disabled = true
		body_black.disabled = false
		
		img_green.visible = false
		img_blue.visible = false
		img_purple.visible = false
		img_black.visible = true
		if enemyType == 1:
			img_black.set_texture(preload("res://Characters/assets/black1.png"))
		elif enemyType == 2:
			img_black.set_texture(preload("res://Characters/assets/black2.png"))
		bad_guy_img = img_black
		
func _physics_process(delta):
	velocity.y = velocity.y + GRAVITY

	if state == "IDLE":
			velocity.x = idle_speed
			velocity = move_and_slide(velocity, Vector2.UP)
		
	if state == "ATTACKING":
		var direction = (good_guy[0].global_position - global_position).normalized()
		velocity += direction * acceleration * delta
		velocity = velocity.clamped(angery_speed)
		flip_img(global_position, good_guy[0].global_position)
		velocity = move_and_slide(velocity, Vector2.UP)
		
func flip_img(pos1, pos2):
	if pos1 > pos2:
		bad_guy_img.set_flip_h(true)
		bad_guy_fov.rotation = PI
	else :
		bad_guy_img.set_flip_h(false)
		bad_guy_fov.rotation = 0
	

func _on_AI_state_changed(current_state):
	if current_state == "IDLE":
		$idleMovementTimer.start(2)
		
		state = "IDLE"
	elif current_state == "ATTACKING":
		
		$idleMovementTimer.stop()
		state = "ATTACKING"

func _on_idleMovementTimer_timeout():
	idle_speed = idle_speed * - 1
	if idle_speed < 0:
		bad_guy_img.set_flip_h(true)
		bad_guy_fov.rotation = PI
	else :
		bad_guy_img.set_flip_h(false)
		bad_guy_fov.rotation = 0
	



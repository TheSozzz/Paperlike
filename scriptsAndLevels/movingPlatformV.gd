extends Node2D

const IDLE_DURATION = 1.0

var blue_texture = preload("res://Characters/assets/bluePlatform.png")
var purple_texture = preload("res://Characters/assets/purplePlatform2.png")

export  var tileNum = 20
export  var whichWay = "up"

export  var speed = 8.0

var follow = Vector2.ZERO

onready var platform = $platform
onready var tween = $tween
onready var sprite = $platform / Sprite
onready var blueCollision = $platform / CollisionPolygonBlue
onready var purpleCollision = $platform / CollisionPolygonPurple

func _ready():
	if whichWay == "up":
		GlobalVariables.move_to_V = Vector2.UP * 64 * tileNum
	elif whichWay == "down":
		GlobalVariables.move_to_V = Vector2.DOWN * 64 * tileNum
	_init_tween()

func _init_tween():
	var duration = GlobalVariables.move_to_V.length() / float(speed * 64)
	tween.interpolate_property(self, "follow", Vector2.ZERO, GlobalVariables.move_to_V, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, IDLE_DURATION)
	tween.interpolate_property(self, "follow", GlobalVariables.move_to_V, Vector2.ZERO, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, duration + IDLE_DURATION * 2)
	tween.start()

func _physics_process(delta):
	if GlobalVariables.scene == "blue":
		sprite.set_texture(blue_texture)
		blueCollision.disabled = false
		purpleCollision.disabled = true
	elif GlobalVariables.scene == "purple":
		sprite.set_texture(purple_texture)
		blueCollision.disabled = true
		purpleCollision.disabled = false
		
	platform.position = platform.position.linear_interpolate(follow, 0.05)

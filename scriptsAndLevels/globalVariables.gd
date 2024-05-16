extends Node


var gravity = 175
var path_to_load_scene = ""
var can_load = false
var speech_lines = [0, 1, 2, 3, 4, 5, 6, 7]
var show_text = false
var move_to_V
var move_to_H
var scene
var fireball_num = 0
var level_start_scene = ""
var dialogueDone = false
var index = 0
var custom_checkpoint = false
var sound_type = "normal"

var enemy_attack_strength = 50

var left_pos
var right_pos
var return_here
var dist_to_midpoint


var health = 200
var can_attack = false
var standard_attack = 50
var targeted_enemy
var teleported = false
var keyNum = 0

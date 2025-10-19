class_name Grandma extends Character

var has_dentures = false
var has_tried_taking_dentures = false

func _init() -> void:
	character_name = "Grandma"
	age = 78
	height = 157
	gender = "Female"
	hair_color = "Brown"
	headshot = preload("res://Characters/Grandma/GrandmaHeadshot.png")
	intro_resource = preload("res://Dialogues/Intro/GrandmaIntro.dialogue")
	
	stage_max_clicks[Global.Stage.INTRO] = 4

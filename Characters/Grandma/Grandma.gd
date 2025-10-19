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
	interrogation_room_texture = preload("res://Characters/Grandma/grandmainterrogation.png")
	
	stage_max_clicks[Global.Stage.INTRO] = 4
	
	stage_dialogue_resources[Global.Stage.INTRO] = preload("res://Dialogues/Intro/GrandmaIntro.dialogue")

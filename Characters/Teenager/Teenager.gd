class_name Teenager extends Character

func _init() -> void:
	character_name = "Teenager"
	age = 15
	height = 175
	gender = "Male"
	hair_color = "Brown"
	headshot = preload("res://Characters/Teenager/TeenagerHeadshot.png")
	interrogation_room_texture = preload("res://Characters/Teenager/teenagerinterrogation.png")
	
	stage_max_clicks[Global.Stage.INTRO] = 4
	
	stage_dialogue_resources[Global.Stage.INTRO] = preload("res://Dialogues/Intro/TeenagerIntro.dialogue")

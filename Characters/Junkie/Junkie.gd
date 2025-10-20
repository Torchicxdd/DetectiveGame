class_name Junkie extends Character

func _init() -> void:
	character_name = "Junkie"
	age = 42
	height = 170
	gender = "Male"
	hair_color = "Grey"
	headshot = preload("res://Characters/Junkie/JunkieHeadshot.png")
	interrogation_room_texture = preload("res://Characters/Junkie/junkieinterrogation.png")
	
	stage_max_clicks[Global.Stage.INTRO] = 4
	
	stage_dialogue_resources[Global.Stage.SUSPICIOUS] = preload("res://Dialogues/PowerMove/PowerMove.dialogue")
	stage_dialogue_resources[Global.Stage.INTRO] = preload("res://Dialogues/Intro/JunkieIntro.dialogue")

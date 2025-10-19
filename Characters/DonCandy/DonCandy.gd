class_name DonCandy extends Character

func _init() -> void:
	character_name = "Little Child"
	age = 7
	height = 122
	gender = "Male"
	hair_color = "Red"
	headshot = preload("res://Characters/DonCandy/DonCandyHeadshot.png")
	interrogation_room_texture = preload("res://Characters/DonCandy/doncandyinterrogation.png")
	
	stage_max_clicks[Global.Stage.INTRO] = 4
	
	stage_dialogue_resources[Global.Stage.INTRO] = preload("res://Dialogues/Intro/DonCandyIntro.dialogue")

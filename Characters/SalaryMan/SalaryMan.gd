class_name SalaryMan extends Character

func _init() -> void:
	character_name = "Salary Man"
	age = 33
	height = 182
	gender = "Male"
	hair_color = "Black"
	headshot = preload("res://Characters/SalaryMan/SalaryManHeadshot.png")
	interrogation_room_texture = preload("res://Characters/SalaryMan/salarymaninterrogation.png")
	
	stage_max_clicks[Global.Stage.INTRO] = 7
	
	stage_dialogue_resources[Global.Stage.INTRO] = preload("res://Dialogues/Intro/SalaryManIntro.dialogue")

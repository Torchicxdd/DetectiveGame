class_name DonCandy extends Character

func _init() -> void:
	character_name = "Little Child"
	age = 7
	height = 122
	gender = "Male"
	hair_color = "Red"
	headshot = preload("res://Characters/DonCandy/LittleChildHeadshot.png")
	
	stage_max_clicks[Global.Stage.INTRO] = 4

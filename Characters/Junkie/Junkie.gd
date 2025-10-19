class_name Junkie extends Character

func _init() -> void:
	character_name = "Junkie"
	age = 42
	height = 170
	gender = "Male"
	hair_color = "Grey"
	headshot = preload("res://Characters/Junkie/JunkieHeadshot.png")
	
	stage_max_clicks[Global.Stage.INTRO] = 4

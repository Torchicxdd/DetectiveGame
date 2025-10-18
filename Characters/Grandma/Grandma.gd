class_name Grandma extends Character

var has_dentures = false
var has_tried_taking_dentures = false

func _init() -> void:
	character_name = "Grandma"
	silent_treatment_percentage = 0
	lie_detector_percentage = 30
	age = 78
	height = 157
	gender = "Female"
	hair_color = "Brown"
	headshot = preload("res://Characters/Grandma/GrandmaHeadshot.png")
	intro_resource = preload("res://Dialogues/Intro/GrandmaIntro.dialogue")

class_name ContinueButton extends Control

func _ready() -> void:
	var character_array = [
		Global.grandma,
		Global.little_child,
		Global.junkie,
		Global.salaryman,
		Global.teenager
	]
	
	for i in character_array:
		var character = i as Character
		if character.stage_has_talked_to[Global.current_stage] == false:
			$TextureRect/Button.disabled = true
			break
		else:
			$TextureRect/Button.disabled = false
		

func _on_button_pressed() -> void:
	Global.current_stage = Global.Stage.SUSPICIOUS

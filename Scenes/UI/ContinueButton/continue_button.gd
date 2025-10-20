class_name ContinueButton extends Control

func _ready() -> void:
	if (Global.current_stage != Global.Stage.SUSPICIOUS):
		$TextureRect/Button.disabled = true
	else:
		$TextureRect/Button.disabled = false

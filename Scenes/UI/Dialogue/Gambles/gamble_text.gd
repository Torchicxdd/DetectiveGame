class_name GambleText extends Control

var button_option: DialogueResponse

func set_option(option: DialogueResponse, percentage: String):
	button_option = option
	$OptionText.text = button_option.text
	$TextureRect/Percentage.text = percentage + "%"

func _on_option_text_pressed() -> void:
	SignalBus.emit_signal("choose_option", button_option)

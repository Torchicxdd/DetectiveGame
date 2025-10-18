class_name OptionsText extends Button

var button_option: DialogueResponse

func set_option(option: DialogueResponse) -> void:
	button_option = option
	text = "◆ " + button_option.text

func _on_pressed() -> void:
	SignalBus.emit_signal("choose_option", button_option)

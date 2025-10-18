class_name OptionsText extends Button

var option_text: String

func set_option(option: String) -> void:
	option_text = option
	text = "◆ " + option_text

func _on_pressed() -> void:
	SignalBus.emit_signal("choose_option", option_text)

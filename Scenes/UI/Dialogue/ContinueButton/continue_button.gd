extends Control

func _on_button_pressed() -> void:
	SignalBus.emit_signal("continue_button_clicked")

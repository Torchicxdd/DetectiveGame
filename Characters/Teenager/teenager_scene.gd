extends TextureButton

func _on_pressed() -> void:
	Global.current_character = Global.teenager
	SignalBus.switch_to_interrogation_room.emit()

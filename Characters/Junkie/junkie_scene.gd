extends TextureButton

func _on_pressed() -> void:
	Global.current_character = Global.junkie
	SignalBus.switch_to_interrogation_room.emit()

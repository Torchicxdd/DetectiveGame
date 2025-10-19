class_name InterrogationRoomSceneButtons extends Control

var journal_is_open = false

func _on_journal_button_pressed() -> void:
	if journal_is_open:
		journal_is_open = false
		SignalBus.emit_signal("close_journal")
	else:
		journal_is_open = true
		SignalBus.emit_signal("open_journal")

func _on_item_viewer_button_pressed() -> void:
	SignalBus.emit_signal("open_item_viewer")

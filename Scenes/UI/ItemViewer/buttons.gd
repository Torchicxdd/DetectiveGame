extends Control

func _on_off_pressed() -> void:
	SignalBus.emit_signal("close_item_viewer")

func _on_items_list_pressed() -> void:
	SignalBus.emit_signal("on_items_list_button_clicked")

func _on_previous_page_pressed() -> void:
	SignalBus.emit_signal("on_previous_button_clicked")

func _on_next_page_pressed() -> void:
	SignalBus.emit_signal("on_next_button_clicked")

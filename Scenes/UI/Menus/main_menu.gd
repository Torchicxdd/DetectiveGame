class_name MainMenu extends Control

func _on_play_pressed() -> void:
	SignalBus.on_menu_click.emit()
	SignalBus.load_game.emit()

func _on_exit_pressed() -> void:
	get_tree().quit()

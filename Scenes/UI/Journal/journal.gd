class_name Journal extends Control

func _ready() -> void:
	SignalBus.connect("close_journal", Callable(self, "_close_journal"))

func _close_journal() -> void:
	Global.main.deleteGUIScene(self)

func _on_tab_1_pressed() -> void:
	SignalBus.emit_signal("open_character_page", 0)

func _on_tab_2_pressed() -> void:
	SignalBus.emit_signal("open_character_page", 1)

func _on_tab_3_pressed() -> void:
	SignalBus.emit_signal("open_character_page", 2)

func _on_tab_4_pressed() -> void:
	SignalBus.emit_signal("open_character_page", 3)

func _on_tab_5_pressed() -> void:
	SignalBus.emit_signal("open_character_page", 4)

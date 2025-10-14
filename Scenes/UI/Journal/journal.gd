class_name Journal extends Control

func _ready() -> void:
	SignalBus.connect("close_journal", Callable(self, "_close_journal"))

func _close_journal() -> void:
	Global.main.deleteGUIScene(self)

func _on_mouse_entered() -> void:
	SignalBus.emit_signal("close_journal")

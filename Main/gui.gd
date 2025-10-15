extends Control

var journal_preload = preload("res://Scenes/UI/journal/journal.tscn")
# var journal_button_preload =
# var chat_preload = 
# var back_button_preload =

func _ready() -> void:
	SignalBus.connect("open_journal", Callable(self, "_open_journal"))

func _open_journal() -> void:
	var instanced_journal = journal_preload.instantiate()
	Global.main.addGUIScene(instanced_journal)

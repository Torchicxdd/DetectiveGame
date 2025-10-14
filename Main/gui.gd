extends Control

var journal = preload("res://Scenes/UI/Journal/Journal.tscn")

func _ready() -> void:
	SignalBus.connect("open_journal", Callable(self, "_open_journal"))

func _open_journal() -> void:
	var instanced_journal = journal.instantiate()
	Global.main.addGUIScene(instanced_journal)

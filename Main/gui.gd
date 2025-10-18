extends Control

var journal_preload = preload("res://Scenes/UI/Journal/Journal.tscn")
var dialogue_viewer_preload = preload("res://Scenes/UI/DialogueViewer/DialogueViewer.tscn")
# var journal_button_preload =
# var chat_preload = 
# var back_button_preload =

func _ready() -> void:
	SignalBus.connect("open_journal", Callable(self, "_open_journal"))
	SignalBus.connect("open_dialogue_viewer", Callable(self, "_open_dialogue_viewer"))

func _open_journal() -> void:
	var instanced_journal = journal_preload.instantiate()
	Global.main.addGUIScene(instanced_journal)

func _open_dialogue_viewer() -> void:
	var instanced_dialogue_viewer = dialogue_viewer_preload.instantiate()
	Global.main.addGUIScene(instanced_dialogue_viewer)

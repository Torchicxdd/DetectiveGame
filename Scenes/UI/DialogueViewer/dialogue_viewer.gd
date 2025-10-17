class_name DialogueViewer extends Control

var normal_dialogue_scene = preload("res://Scenes/UI/Dialogue/NormalDialogue.tscn")
var inner_thoughts_scene = preload("res://Scenes/UI/Dialogue/InnerThoughtsDialogue.tscn")

func _ready() -> void:
	SignalBus.connect("add_dialogue", Callable(self, "_add_dialogue"))

func _add_dialogue(name: String, dialogue: String, is_inner_thoughts: bool) -> void:
	var instance: DialogueItem
	if (is_inner_thoughts):
		instance = inner_thoughts_scene.instantiate()
	else:
		instance = normal_dialogue_scene.instantiate()
		
	instance.set_character_name(name, true)
	instance.set_dialogue(dialogue)
	$Wrapper/ScrollContainer/MarginContainer/VDialogueDisplay.add_child(instance)
	# Have to redraw in order for separation to take effect for vbox
	$Wrapper/ScrollContainer/MarginContainer/VDialogueDisplay.queue_redraw()

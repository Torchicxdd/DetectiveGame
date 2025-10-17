class_name DialogueViewer extends Control

var normal_dialogue_scene = preload("res://Scenes/UI/Dialogue/NormalDialogue.tscn")
var inner_thoughts_scene = preload("res://Scenes/UI/Dialogue/InnerThoughtsDialogue.tscn")
var options_dialogue_scene = preload("res://Scenes/UI/Dialogue/OptionsDialogue.tscn")

func _ready() -> void:
	SignalBus.connect("add_dialogue", Callable(self, "_add_dialogue"))
	SignalBus.connect("add_options", Callable(self, "_add_options"))
	SignalBus.emit_signal("add_dialogue", "Me", "Some Dialogue", false)
	SignalBus.emit_signal("add_dialogue", "You", "Some Other Dialogue", true)
	var opts: Array[String] = ["Option 1", "Option 2"]
	SignalBus.emit_signal("add_options", opts)

func _add_dialogue(name: String, dialogue: String, is_inner_thoughts: bool) -> void:
	var instance: DialogueItem
	if (is_inner_thoughts):
		instance = inner_thoughts_scene.instantiate()
		instance.set_character_name(name, true)
	else:
		instance = normal_dialogue_scene.instantiate()
		instance.set_character_name(name, false)
		
	instance.set_dialogue(dialogue)
	$Wrapper/ScrollContainer/MarginContainer/VDialogueDisplay.add_child(instance)
	# Have to redraw in order for separation to take effect for vbox
	$Wrapper/ScrollContainer/MarginContainer/VDialogueDisplay.queue_redraw()

func _add_options(options: Array[String]) -> void:
	var instance = options_dialogue_scene.instantiate() as OptionsDialogue
	instance.set_options(options)
	$Wrapper/ScrollContainer/MarginContainer/VDialogueDisplay.add_child(instance)
	$Wrapper/ScrollContainer/MarginContainer/VDialogueDisplay.queue_redraw()

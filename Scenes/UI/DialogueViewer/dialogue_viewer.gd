class_name DialogueViewer extends Control

var normal_dialogue_scene = preload("res://Scenes/UI/Dialogue/NormalDialogue.tscn")
var inner_thoughts_scene = preload("res://Scenes/UI/Dialogue/InnerThoughtsDialogue.tscn")
var options_dialogue_scene = preload("res://Scenes/UI/Dialogue/OptionsDialogue.tscn")
@onready var dialogue_display = $Wrapper/ScrollContainer/MarginContainer/VDialogueDisplay

func _ready() -> void:
	SignalBus.connect("add_dialogue", Callable(self, "_add_dialogue"))
	SignalBus.connect("add_options", Callable(self, "_add_options"))
	SignalBus.connect("choose_option", Callable(self, "_choose_option"))

func _add_dialogue(name: String, dialogue: String, is_inner_thoughts: bool) -> void:
	var instance: DialogueItem
	if (is_inner_thoughts):
		instance = inner_thoughts_scene.instantiate()
		instance.set_character_name(name, true)
	else:
		instance = normal_dialogue_scene.instantiate()
		instance.set_character_name(name, false)
		
	instance.set_dialogue(dialogue)
	dialogue_display.add_child(instance)
	# Have to redraw in order for separation to take effect for vbox
	dialogue_display.queue_redraw()

func _add_options(options: Array[DialogueResponse]) -> void:
	var instance = options_dialogue_scene.instantiate() as OptionsDialogue
	instance.set_options(options)
	dialogue_display.add_child(instance)
	dialogue_display.queue_redraw()

func _choose_option(option: String) -> void:
	var instance = normal_dialogue_scene.instantiate() as DialogueItem
	instance.set_character_name("You", false)
	instance.set_dialogue(option)
	
	# Remove options dialogue and push response
	dialogue_display.get_child(dialogue_display.get_child_count() - 1).queue_free()
	dialogue_display.add_child(instance)
	# Have to redraw in order for separation to take effect for vbox
	dialogue_display.queue_redraw()

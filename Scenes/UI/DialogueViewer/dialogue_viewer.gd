class_name DialogueViewer extends Control

@onready var dialogue_display = $ScrollContainer/MarginContainer/VDialogueDisplay
@onready var scroll_container = $ScrollContainer
@onready var character_image = $CharacterDisplay/CharacterImage
@onready var character_name = $CharacterDisplay/VBoxContainer/CharacterName

var normal_dialogue_scene = preload("res://Scenes/UI/Dialogue/NormalDialogue.tscn")
var inner_thoughts_scene = preload("res://Scenes/UI/Dialogue/InnerThoughtsDialogue.tscn")
var options_dialogue_scene = preload("res://Scenes/UI/Dialogue/OptionsDialogue.tscn")
var continue_button = preload("res://Scenes/UI/Dialogue/ContinueButton/ContinueButton.tscn")

# Create dialogue reader
var dialogue_reader: DialogueReader

func _init() -> void:
	dialogue_reader = DialogueReader.new()

func _ready() -> void:
	SignalBus.connect("add_dialogue", Callable(self, "_add_dialogue"))
	SignalBus.connect("add_options", Callable(self, "_add_options"))
	SignalBus.connect("choose_option", Callable(self, "_choose_option"))
	SignalBus.connect("add_continue_button", Callable(self, "_add_continue_button"))
	SignalBus.connect("continue_button_clicked", Callable(self, "_continue_button_clicked"))
	
	character_image.texture = Global.current_character.headshot
	character_name.text = Global.current_character.character_name
	
	SignalBus.emit_signal("start_dialogue_reader", Global.current_character.stage_dialogue_resources[Global.current_stage], Global.current_character, Global.current_stage)

func _exit_tree() -> void:
	dialogue_reader.cleanup()
	SignalBus.disconnect("add_dialogue", Callable(self, "_add_dialogue"))
	SignalBus.disconnect("add_options", Callable(self, "_add_options"))
	SignalBus.disconnect("choose_option", Callable(self, "_choose_option"))
	SignalBus.disconnect("add_continue_button", Callable(self, "_add_continue_button"))
	SignalBus.disconnect("continue_button_clicked", Callable(self, "_continue_button_clicked"))

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
	await get_tree().process_frame
	scroll_container.scroll_vertical = scroll_container.get_v_scroll_bar().max_value
	SignalBus.emit_signal("process_next_dialogue")

func _add_options(options: Array[DialogueResponse]) -> void:
	var instance = options_dialogue_scene.instantiate() as OptionsDialogue
	instance.set_options(options)
	dialogue_display.add_child(instance)
	dialogue_display.queue_redraw()
	await get_tree().process_frame
	scroll_container.scroll_vertical = scroll_container.get_v_scroll_bar().max_value

func _choose_option(option: DialogueResponse) -> void:
	var instance = normal_dialogue_scene.instantiate() as DialogueItem
	instance.set_character_name("You", false)
	instance.set_dialogue(option.text)
	
	# Remove options dialogue and push response
	var options = dialogue_display.get_child(dialogue_display.get_child_count() - 1)
	dialogue_display.remove_child(options)
	options.queue_free()
	dialogue_display.add_child(instance)
	# Have to redraw in order for separation to take effect for vbox
	dialogue_display.queue_redraw()
	SignalBus.emit_signal("process_chosen_option", option)

func _add_continue_button() -> void:
	var button = continue_button.instantiate()
	dialogue_display.add_child(button)
	dialogue_display.queue_redraw()
	await get_tree().process_frame
	scroll_container.scroll_vertical = scroll_container.get_v_scroll_bar().max_value

func _continue_button_clicked() -> void:
	var continue_button = dialogue_display.get_child(dialogue_display.get_child_count() - 1)
	dialogue_display.remove_child(continue_button)
	continue_button.queue_free()
	dialogue_display.queue_redraw()
	SignalBus.emit_signal("on_continue_button_deleted")

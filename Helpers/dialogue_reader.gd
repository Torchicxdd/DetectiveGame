class_name DialogueReader extends Node

var dialogue_resource: DialogueResource = null

var current_dialogue_line: DialogueLine = null
var current_character: String
var current_is_inner_thoughts = false

var next_dialogue_id: String = ""
var previous_line_was_dialogue = false

func _init() -> void:
	SignalBus.connect("start_dialogue_reader", Callable(self, "_start_dialogue_reader"))
	SignalBus.connect("process_chosen_option", Callable(self, "_process_chosen_option"))
	SignalBus.connect("on_continue_button_deleted", Callable(self, "_add_dialogue"))
	SignalBus.connect("process_next_dialogue", Callable(self, "_process_next_dialogue"))

func _start_dialogue_reader(resource: DialogueResource) -> void:
	dialogue_resource = resource
	_process_next_dialogue()

# Sets next_id and sends signal to add dialogue
func _process_next_dialogue() -> void:
	if (current_dialogue_line == null):
		# First pass
		current_dialogue_line = await DialogueManager.get_next_dialogue_line(dialogue_resource, "start")
	else:
		current_dialogue_line = await DialogueManager.get_next_dialogue_line(dialogue_resource, next_dialogue_id)
		
	process_dialogue_line()

func process_dialogue_line() -> void:
	if (current_dialogue_line == null):
		# Empty dialogue line. No more dialogue
		SignalBus.emit_signal("end_dialogue")
	elif (current_dialogue_line.text != ""):
		# Simple dialogue
		next_dialogue_id = current_dialogue_line.next_id
		current_character = current_dialogue_line.character
		current_is_inner_thoughts = false
		if (current_character == "Inner Thoughts"):
			current_is_inner_thoughts = true
		
		check_if_add_continue_button()
	elif (current_dialogue_line.responses.size() > 0):
		var responses: Array[DialogueResponse] = current_dialogue_line.responses
		previous_line_was_dialogue = false
		SignalBus.emit_signal("add_options", responses)

func _process_chosen_option(response: DialogueResponse) -> void:
	next_dialogue_id = response.next_id
	_process_next_dialogue()

func check_if_add_continue_button() -> void:
	if (previous_line_was_dialogue):
		# add continue button
		SignalBus.emit_signal("add_continue_button")
	else:
		previous_line_was_dialogue = true
		_add_dialogue()

func _add_dialogue() -> void:
	SignalBus.emit_signal("add_dialogue", current_character, current_dialogue_line.text, current_is_inner_thoughts)

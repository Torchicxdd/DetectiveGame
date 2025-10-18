class_name DialogueReader extends Node

var dialogue_resource: DialogueResource = null
var current_dialogue_line: DialogueLine = null
var next_dialogue_id: String = ""

func _init() -> void:
	SignalBus.connect("start_dialogue_reader", Callable(self, "_start_dialogue_reader"))
	SignalBus.connect("process_chosen_option", Callable(self, "_process_response"))

func _start_dialogue_reader(resource: DialogueResource) -> void:
	dialogue_resource = resource
	read_dialogue()

# Sets next_id and sends signal to add dialogue
func read_dialogue() -> void:
	if (current_dialogue_line == null):
		# First pass
		current_dialogue_line = await DialogueManager.get_next_dialogue_line(dialogue_resource, "start")
	else:
		current_dialogue_line = await DialogueManager.get_next_dialogue_line(dialogue_resource, next_dialogue_id)
	
	process_dialogue_line()

func process_dialogue_line() -> void:
	if (typeof(current_dialogue_line) == TYPE_DICTIONARY and current_dialogue_line.size() == 0):
		# Empty dialogue line. No more dialogue
		SignalBus.emit_signal("end_dialogue")
	elif (current_dialogue_line.text != ""):
		# Simple dialogue
		next_dialogue_id = current_dialogue_line.next_id
		var character = current_dialogue_line.character
		var is_inner_thoughts = false
		if (character == "Inner Thoughts"):
			is_inner_thoughts = true
		SignalBus.emit_signal("add_dialogue", character, current_dialogue_line.text, is_inner_thoughts)
	elif (current_dialogue_line.responses.size() > 0):
		var responses: Array[DialogueResponse] = current_dialogue_line.responses
		SignalBus.emit_signal("add_options", responses)

func _process_response(response: DialogueResponse) -> void:
	next_dialogue_id = response.next_id
	read_dialogue()

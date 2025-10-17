extends ScrollContainer


@onready var dialogue_vbox = $VBoxContainer

func _ready():
	DialogueManager.connect("dialogue_updated", Callable(self, "_on_dialogue_updated"))
	# Initial load if needed
	_load_dialogue("Grandma")

func _load_dialogue(character_name: String):
	var dialogue_data = DialogueManager.get_dialogue(character_name)
	_display_dialogue(dialogue_data)

func _display_dialogue(dialogue_data):
	# Clear previous dialogue and choices
	dialogue_vbox.clear()
	
	# Add dialogue lines
	for line in dialogue_data.lines:
		var label = Label.new()
		label.text = line
		dialogue_vbox.add_child(label)
	
	# Add response choices as buttons
	for choice in dialogue_data.choices:
		var btn := Button.new()
		btn.text = choice.text

		btn.pressed.connect(func(): call_deferred("_on_choice_selected", choice.id))

		dialogue_vbox.add_child(btn)

	# Scroll to bottom so new text is visible
	scroll_vertical = dialogue_vbox.get_combined_minimum_size().y

func _on_choice_selected(choice_id):
	DialogueManager.select_choice(choice_id)

func _on_dialogue_updated():
	var current_dialogue = DialogueManager.get_current_dialogue()
	_display_dialogue(current_dialogue)
func _init() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

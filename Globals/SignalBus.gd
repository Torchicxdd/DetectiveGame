extends Node

# UI Signals
signal open_journal()
signal close_journal()
signal open_character_page(tab_num: int)
signal open_dialogue_viewer()
signal close_dialogue_viewer()

# Logic Signals
signal set_character_info(character: Character)

signal add_dialogue(name: String, dialogue: String, is_inner_thoughts: bool)
signal add_options(options: Array[DialogueResponse])
signal choose_option(option: DialogueResponse)
signal end_dialogue()

signal start_dialogue_reader(dialogue_resource: DialogueResource)

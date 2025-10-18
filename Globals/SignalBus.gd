extends Node

# UI Signals
signal open_journal()
signal close_journal()
signal open_character_page(tab_num: int)
signal open_dialogue_viewer()
signal close_dialogue_viewer()

# Logic Signals
signal set_character_info(character: Character)

# Dialogue Related Signals
signal add_dialogue(name: String, dialogue: String, is_inner_thoughts: bool)
signal add_options(options: Array[DialogueResponse])
signal choose_option(option: DialogueResponse)
signal end_dialogue()
signal add_continue_button()
signal continue_button_clicked()
signal on_continue_button_deleted()

signal start_dialogue_reader(dialogue_resource: DialogueResource)
signal process_chosen_option(option: DialogueResponse)
signal process_next_dialogue()

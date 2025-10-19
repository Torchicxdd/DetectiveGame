extends Node

# World Signals
signal switch_to_interrogation_room()
signal switch_to_character_select_room()

# UI Signals
signal load_game()
signal open_settings()
signal open_journal()
signal close_journal()
signal open_character_page(tab_num: int)
signal open_item_viewer()
signal close_item_viewer()
signal open_item_description(item: Evidence)

# Logic Signals
signal set_character_info(character: Character)

# Dialogue Related Signals
signal add_dialogue(name: String, dialogue: String, is_inner_thoughts: bool)
signal add_options(options: Array[DialogueResponse])
signal choose_option(option: DialogueResponse)
signal add_continue_button()
signal continue_button_clicked()
signal on_continue_button_deleted()

signal start_dialogue_reader(dialogue_resource: DialogueResource, character: Character, stage: Global.Stage)
signal process_chosen_option(option: DialogueResponse)
signal process_next_dialogue()

# Item Viewer Signals
signal on_items_list_button_clicked()
signal on_previous_button_clicked()
signal on_next_button_clicked()
signal disable_next_button()
signal enable_next_button()
signal disable_previous_button()
signal enable_previous_button()

# Meter Signals
signal meter_percentage_changed(new_percentage: float)

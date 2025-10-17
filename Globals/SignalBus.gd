extends Node

# UI Signals
signal open_journal()
signal close_journal()
signal open_character_page(tab_num: int)
signal set_character_info(character: Character)
signal open_dialogue_viewer()
signal close_dialogue_viewer()
signal add_dialogue(name: String, dialogue: String, is_inner_thoughts: bool)
signal add_options(options: Array[String])

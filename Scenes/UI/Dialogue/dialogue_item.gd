class_name DialogueItem extends VBoxContainer

func set_character_name(name: String) -> void:
	$Character.text = "~ " + name

func set_dialogue(dialogue: String) -> void:
	$Dialogue.text = dialogue

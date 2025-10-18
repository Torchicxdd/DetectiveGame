class_name DialogueItem extends VBoxContainer

func set_character_name(name: String, is_inner_thoughts: bool = false) -> void:
	if (is_inner_thoughts):
		$Character.text = "~ " + name
	else:
		$Character.text = name

func set_dialogue(dialogue: String) -> void:
	$Dialogue.text = dialogue

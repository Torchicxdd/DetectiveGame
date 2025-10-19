class_name OptionsDialogue extends VBoxContainer

var option_text = preload("res://Scenes/UI/Dialogue/Options/OptionsText.tscn")
var gamble_text = preload("res://Scenes/UI/Dialogue/Gambles/GambleText.tscn")

func set_options(options: Array[DialogueResponse]) -> void:
	for i in options:
		if i.is_allowed:
			if check_tags(i):
				var instance = option_text.instantiate() as OptionsText
				instance.set_option(i)
				$Options.add_child(instance)
	# Redraw for options separation
	$Options.queue_redraw()

func check_tags(response: DialogueResponse) -> bool:
	var percentage = response.get_tag_value("percentage")
	if percentage != "":
		var instance = gamble_text.instantiate() as GambleText
		instance.set_option(response, percentage)
		$Options.add_child(instance)
		return false
	return true

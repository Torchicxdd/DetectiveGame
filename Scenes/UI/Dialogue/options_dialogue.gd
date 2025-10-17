class_name OptionsDialogue extends VBoxContainer

var option_text = preload("res://Scenes/UI/Dialogue/Options/OptionsText.tscn")

func set_options(options: Array[String]) -> void:
	for i in options:
		var instance = option_text.instantiate() as OptionsText
		instance.set_option(i)
		$Options.add_child(instance)
	# Redraw for options separation
	$Options.queue_redraw()

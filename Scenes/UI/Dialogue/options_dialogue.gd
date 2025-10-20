class_name OptionsDialogue extends VBoxContainer

var option_text = preload("res://Scenes/UI/Dialogue/Options/OptionsText.tscn")
var gamble_text = preload("res://Scenes/UI/Dialogue/Gambles/GambleText.tscn")
var power_move_text = preload("res://Scenes/UI/Dialogue/PowerMoves/PowerMove.tscn")

var lick_button = preload("res://Scenes/UI/Dialogue/PowerMoves/lick.png")
var gun_button = preload("res://Scenes/UI/Dialogue/PowerMoves/gun.png")
var aura_button = preload("res://Scenes/UI/Dialogue/PowerMoves/aura.png")
var tickle_button = preload("res://Scenes/UI/Dialogue/PowerMoves/tickle.png")
var silent_button = preload("res://Scenes/UI/Dialogue/PowerMoves/silent.png")

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
	var power_move = response.get_tag_value("power_move")
	if percentage != "":
		var instance = gamble_text.instantiate() as GambleText
		instance.set_option(response, percentage)
		$Options.add_child(instance)
		return false
	elif power_move != "":
		var instance = power_move_text.instantiate() as TextureButton
		match power_move:
			"lick": instance.texture_normal = lick_button
			"gun": instance.texture_normal = gun_button
			"aura": instance.texture_normal = aura_button
			"tickle": instance.texture_normal = tickle_button
			"silent": instance.texture_normal = silent_button
		$Options.add_child(instance)
		return false
	return true

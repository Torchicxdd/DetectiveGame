class_name DialogueViewer extends Control

var dialogue_item_scene = preload("res://Scenes/UI/Dialogue/DialogueItem.tscn")

func _ready() -> void:
	for i in range(10):
		var instance = dialogue_item_scene.instantiate() as DialogueItem
		instance.set_character_name("Inner Thoughts")
		if (i != 2):
			instance.set_dialogue("I- I was walking my son to get some candy for Halloween. Inner Thoughts: He’s not thinking about the question you just asked him. He’s thinking about the wife back home cooking up a storm fully knowing the he was supposed to be back home by 9:30.")
		else:
			instance.set_dialogue("Example")
		$Wrapper/ScrollContainer/MarginContainer/VDialogueDisplay.add_child(instance)
		
	# Have to redraw in order for separation to take effect for vbox
	$Wrapper/ScrollContainer/MarginContainer/VDialogueDisplay.queue_redraw()

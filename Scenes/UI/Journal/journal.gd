class_name Journal extends Control

var evidence_scene = preload("res://Scenes/UI/EvidenceItem/EvidenceItem.tscn")

func _ready() -> void:
	SignalBus.connect("close_journal", Callable(self, "_close_journal"))
	SignalBus.connect("set_character_info", Callable(self, "_set_character_info"))
	SignalBus.emit_signal("open_character_page", 0)

func _exit_tree() -> void:
	SignalBus.disconnect("close_journal", Callable(self, "_close_journal"))
	SignalBus.disconnect("set_character_info", Callable(self, "_set_character_info"))

func _close_journal() -> void:
	Global.main.deleteGUIScene(self)

func _on_tab_1_pressed() -> void:
	$TabChangeEffectPlayer.play()
	SignalBus.emit_signal("open_character_page", 0)

func _on_tab_2_pressed() -> void:
	$TabChangeEffectPlayer.play()
	SignalBus.emit_signal("open_character_page", 1)

func _on_tab_3_pressed() -> void:
	$TabChangeEffectPlayer.play()
	SignalBus.emit_signal("open_character_page", 2)

func _on_tab_4_pressed() -> void:
	$TabChangeEffectPlayer.play()
	SignalBus.emit_signal("open_character_page", 3)

func _on_tab_5_pressed() -> void:
	$TabChangeEffectPlayer.play()
	SignalBus.emit_signal("open_character_page", 4)

func _set_character_info(character: Character) -> void:
	$CharacterImage.texture = character.headshot
	$CharacterInfo/HBoxContainer/CustomName.text = character.character_name
	$CharacterInfo/HBoxContainer2/CustomAge.text = str(character.age) + " " + "old"
	$CharacterInfo/HBoxContainer3/CustomHeight.text = str(character.height) + " " + "cm"
	$CharacterInfo/HBoxContainer4/CustomGender.text = character.gender
	$CharacterInfo/HBoxContainer5/CustomHairColor.text = character.hair_color
	remove_evidence_items()
	add_evidence_items(character)

func add_evidence_items(character: Character) -> void:
	var counter = 0 
	for i in Items.items_list:
		if i.is_unlocked:
			if i.relations.has(character):
				var scene = evidence_scene.instantiate() as EvidenceItem
				if (i.relations.get(character)):
					scene.set_item(i)
				$EvidenceGrid.add_child(scene)
				counter += 1
	
	if (counter < 9):
		while (counter < 9):
			var scene = evidence_scene.instantiate() as EvidenceItem
			scene.modulate.a = 0.0
			$EvidenceGrid.add_child(scene)
			counter += 1

func remove_evidence_items() -> void:
	for item in $EvidenceGrid.get_children():
		$EvidenceGrid.remove_child(item)
		item.queue_free()

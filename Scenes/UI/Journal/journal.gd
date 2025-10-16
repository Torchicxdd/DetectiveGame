class_name Journal extends Control

var evidence_scene = preload("res://Scenes/UI/EvidenceItem/EvidenceItem.tscn")

func _ready() -> void:
	SignalBus.connect("close_journal", Callable(self, "_close_journal"))
	SignalBus.connect("set_character_info", Callable(self, "_set_character_info"))
	SignalBus.emit_signal("open_character_page", 0)

func _close_journal() -> void:
	Global.main.deleteGUIScene(self)

func _on_tab_1_pressed() -> void:
	SignalBus.emit_signal("open_character_page", 0)

func _on_tab_2_pressed() -> void:
	SignalBus.emit_signal("open_character_page", 1)

func _on_tab_3_pressed() -> void:
	SignalBus.emit_signal("open_character_page", 2)

func _on_tab_4_pressed() -> void:
	SignalBus.emit_signal("open_character_page", 3)

func _on_tab_5_pressed() -> void:
	SignalBus.emit_signal("open_character_page", 4)

func _set_character_info(character: Character) -> void:
	$CharacterImage.texture = character.headshot
	$CharacterInfo/HBoxContainer/CustomName.text = character.character_name
	$CharacterInfo/HBoxContainer2/CustomAge.text = str(character.age) + " " + "old"
	$CharacterInfo/HBoxContainer3/CustomHeight.text = str(character.height) + " " + "cm"
	$CharacterInfo/HBoxContainer4/CustomGender.text = character.gender
	$CharacterInfo/HBoxContainer5/CustomHairColor.text = character.hair_color
	remove_evidence_items()
	add_evidence_items(character.evidence_list)

func add_evidence_items(evidence_items: Array[Evidence]) -> void:
	for i in evidence_items:
		var scene = evidence_scene.instantiate() as EvidenceItem
		scene.set_item_image_and_name(i.image,i.ItemName)
		$EvidenceGrid.add_child(scene)

func remove_evidence_items() -> void:
	for item in $EvidenceGrid.get_children():
		$EvidenceGrid.remove_child(item)
		item.queue_free()

class_name EvidenceItem extends Control

var image: Texture2D = preload("res://Scenes/UI/EvidenceItem/empty_item.png")
var itemName: String = "???"
var has_been_set = false
var evidence: Evidence

func _ready() -> void:
	if not has_been_set:
		$Item.texture = image
		$ItemName.text = itemName

func set_item(item: Evidence) -> void:
	evidence = item
	$Item.texture = evidence.image
	$ItemName.text = evidence.ItemName
	has_been_set = true
	
func _on_pressed() -> void:
	$HoverEffectPlayer.play()
	if (has_been_set):
		SignalBus.emit_signal("open_item_description", evidence)

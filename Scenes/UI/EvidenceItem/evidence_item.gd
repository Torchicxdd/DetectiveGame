class_name EvidenceItem extends Control

var image: Texture2D = preload("res://Scenes/UI/EvidenceItem/empty_item.png")
var itemName: String = "???"
var has_been_set = false

func _ready() -> void:
	if not has_been_set:
		$Item.texture = image
		$ItemName.text = itemName

func set_item_image_and_name(itemImage: Texture2D,name:String) -> void:
	$Item.texture = itemImage
	$ItemName.text = name
	has_been_set = true

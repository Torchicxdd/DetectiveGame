class_name EvidenceItem extends Control
	
func set_item_image_and_name(itemImage: Texture2D,name:String) -> void:
	$Item.texture = itemImage
	$ItemName.text = name

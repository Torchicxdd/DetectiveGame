class_name ItemDescriptionImage extends Control

func set_item(item: Evidence):
	$Control2/Item.texture = item.image
	$Name.text = item.name

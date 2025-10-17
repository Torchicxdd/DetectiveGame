extends Control

var evidence_scene = preload("res://Scenes/UI/EvidenceItem/EvidenceItem.tscn")

func _ready() -> void:
	$CRTDisplay.texture = $ContentViewport.get_texture()
	
	var counter = 0 
	for i in Items.items_list:
		var scene = evidence_scene.instantiate() as EvidenceItem
		if i.is_unlocked:
			scene.set_item_image_and_name(i.image,i.ItemName)
		$ContentViewport/EvidenceGrid.add_child(scene)
		counter += 1
	
	if (counter < 12):
		while (counter < 12):
			var scene = evidence_scene.instantiate() as EvidenceItem
			scene.modulate.a = 0.0
			$ContentViewport/EvidenceGrid.add_child(scene)
			counter += 1

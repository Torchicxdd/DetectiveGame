extends Control

@onready var content_viewport = $SubViewportContainer/ContentViewport
@onready var evidence_grid = $SubViewportContainer/ContentViewport/EvidenceGrid

var evidence_scene = preload("res://Scenes/UI/EvidenceItem/EvidenceItem.tscn")

func _ready() -> void:
	SignalBus.connect("on_items_list_button_clicked", Callable(self, "_on_items_list_button_clicked"))
	SignalBus.connect("on_previous_button_clicked", Callable(self, "_on_previous_button_clicked"))
	SignalBus.connect("on_next_button_clicked", Callable(self, "_on_next_button_clicked"))
	
	set_items_in_viewer()

func set_items_in_viewer() -> void:
	var counter = 0 
	for i in Items.items_list:
		var scene = evidence_scene.instantiate() as EvidenceItem
		if i.is_unlocked:
			scene.set_item_image_and_name(i.image,i.ItemName)
		evidence_grid.add_child(scene)
		counter += 1
	
	if (counter < 12):
		while (counter < 12):
			var scene = evidence_scene.instantiate() as EvidenceItem
			scene.modulate.a = 0.0
			evidence_grid.add_child(scene)
			counter += 1

func _on_items_list_button_clicked() -> void:
	pass
	
func _on_previous_button_clicked() -> void:
	pass
	
func _on_next_button_clicked() -> void:
	pass

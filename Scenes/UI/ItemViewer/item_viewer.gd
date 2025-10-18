extends Control

@onready var content_viewport = $SubViewportContainer/ContentViewport
@onready var evidence_grid = $SubViewportContainer/ContentViewport/EvidenceGrid
@onready var page_count = $SubViewportContainer/ContentViewport/ItemsTitle/MarginContainer/PageCount

var evidence_scene = preload("res://Scenes/UI/EvidenceItem/EvidenceItem.tscn")

var current_page = 0
var total_page_count = 1
var grid_limit = 12

func _ready() -> void:
	SignalBus.connect("on_items_list_button_clicked", Callable(self, "_on_items_list_button_clicked"))
	SignalBus.connect("on_previous_button_clicked", Callable(self, "_on_previous_button_clicked"))
	SignalBus.connect("on_next_button_clicked", Callable(self, "_on_next_button_clicked"))
	
	set_page_count()
	set_page_count_ui()
	set_items_in_viewer()

func set_items_in_viewer() -> void:
	for i in range(grid_limit):
		if (i + (grid_limit * current_page) < Items.items_list.size()):
			var item  = Items.items_list[i + (grid_limit * current_page)]
			var scene = evidence_scene.instantiate() as EvidenceItem
			if item.is_unlocked:
				scene.set_item_image_and_name(item.image,item.ItemName)
			evidence_grid.add_child(scene)
		else:
			var left_to_put = grid_limit - i
			for k in range(left_to_put):
				var scene = evidence_scene.instantiate() as EvidenceItem
				scene.modulate.a = 0.0
				evidence_grid.add_child(scene)
			break

func clear_evidence_grid() -> void:
	for i in evidence_grid.get_children():
		i.queue_free()

func set_page_count():
	total_page_count = int(ceil(float(Items.items_list.size()) / grid_limit))
	
func set_page_count_ui():
	page_count.text = str(current_page + 1) + " / " + str(total_page_count)

func _on_items_list_button_clicked() -> void:
	if (current_page > 0):
		current_page = 0
		reset_evidence_grid()
		SignalBus.emit_signal("enable_next_button")
		SignalBus.emit_signal("disable_previous_button")

func _on_previous_button_clicked() -> void:
	if (current_page + 1 == total_page_count):
		SignalBus.emit_signal("enable_next_button")
		
	current_page -= 1
	if (current_page == 0):
		SignalBus.emit_signal("disable_previous_button")
	reset_evidence_grid()
	
func _on_next_button_clicked() -> void:
	if (current_page == 0):
		SignalBus.emit_signal("enable_previous_button")
		
	current_page += 1
	if (current_page + 1 == total_page_count):
		SignalBus.emit_signal("disable_next_button")
		
	reset_evidence_grid()

func reset_evidence_grid() -> void:
	set_page_count_ui()
	clear_evidence_grid()
	set_items_in_viewer()

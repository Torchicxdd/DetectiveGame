extends VBoxContainer

var active_tab = preload("res://Scenes/UI/Journal/active_tab.png")
var inactive_tab = preload("res://Scenes/UI/Journal/inactive_tab.png")

func _ready() -> void:
	SignalBus.connect("open_character_page", Callable(self, "_open_character_page"))
	
	set_tab_names()

func _exit_tree() -> void:
	SignalBus.disconnect("open_character_page", Callable(self, "_open_character_page"))

func _open_character_page(tabs_num: int) -> void:
	$Tab1.texture_normal = inactive_tab
	$Tab2.texture_normal = inactive_tab
	$Tab3.texture_normal = inactive_tab
	$Tab4.texture_normal = inactive_tab
	$Tab5.texture_normal = inactive_tab
	match tabs_num:
		0:
			$Tab1.texture_normal = active_tab
			SignalBus.emit_signal("set_character_info", Global.grandma)
		1:
			$Tab2.texture_normal = active_tab
			SignalBus.emit_signal("set_character_info", Global.little_child)
		2:
			$Tab3.texture_normal = active_tab
			SignalBus.emit_signal("set_character_info", Global.junkie)
		3:
			$Tab4.texture_normal = active_tab
			SignalBus.emit_signal("set_character_info", Global.salaryman)
		4:
			$Tab5.texture_normal = active_tab
			SignalBus.emit_signal("set_character_info", Global.teenager)
	
	set_tab_names()

func set_tab_names() -> void:
	$Tab1/Label.text = Global.grandma.character_name
	$Tab2/Label.text = Global.little_child.character_name
	$Tab3/Label.text = Global.junkie.character_name
	$Tab4/Label.text = Global.salaryman.character_name
	$Tab5/Label.text = Global.teenager.character_name

extends Node

func _ready() -> void:
	SignalBus.on_menu_click.connect(_on_menu_clicked)
	SignalBus.switch_to_character_select_room.connect(_switch_room)
	SignalBus.switch_to_interrogation_room.connect(_switch_room)

func _on_menu_clicked() -> void:
	$OnMenuClick.play()

func _switch_room() -> void:
	$SwitchingRooms.play()

class_name InterrogationRoom extends Node2D

func _ready() -> void:
	SignalBus.emit_signal("instantiate_interrogation_room_scene_buttons")
	SignalBus.emit_signal("open_dialogue_viewer")

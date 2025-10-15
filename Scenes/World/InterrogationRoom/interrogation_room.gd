class_name InterrogationRoom extends Node2D

func _ready() -> void:
	SignalBus.emit_signal("open_journal")

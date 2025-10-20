class_name InterrogationRoomSceneButtons extends Control

var journal_is_open = false

func _ready() -> void:
	SignalBus.close_journal.connect(_journal_closed)
	SignalBus.open_journal.connect(_journal_opened)

func _on_journal_button_pressed() -> void:
	if journal_is_open:
		_journal_closed()
		SignalBus.emit_signal("close_journal")
	else:
		_journal_opened()
		SignalBus.emit_signal("open_journal")

func _on_item_viewer_button_pressed() -> void:
	SignalBus.emit_signal("open_item_viewer")

func _journal_closed():
	journal_is_open = false
	
func _journal_opened():
	journal_is_open = true

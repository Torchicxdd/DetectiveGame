extends Control

@onready var next_button = $Pagers/NextPage
@onready var previous_button = $Pagers/PreviousPage

func _ready() -> void:
	SignalBus.connect("enable_next_button", Callable(self, "_enable_next_button"))
	SignalBus.connect("enable_previous_button", Callable(self, "_enable_previous_button"))
	SignalBus.connect("disable_next_button", Callable(self, "_disable_next_button"))
	SignalBus.connect("disable_previous_button", Callable(self, "_disable_previous_button"))

func _on_off_pressed() -> void:
	$TvBtnEffectPlayer.play()
	SignalBus.emit_signal("close_item_viewer")

func _on_items_list_pressed() -> void:
	$TvBtnEffectPlayer.play()
	SignalBus.emit_signal("on_items_list_button_clicked")

func _on_previous_page_pressed() -> void:
	$TvBtnEffectPlayer.play()
	SignalBus.emit_signal("on_previous_button_clicked")

func _on_next_page_pressed() -> void:
	$TvBtnEffectPlayer.play()
	SignalBus.emit_signal("on_next_button_clicked")

func _enable_next_button() -> void:
	next_button.disabled = false

func _disable_next_button() -> void:
	next_button.disabled = true
	
func _enable_previous_button() -> void:
	previous_button.disabled = false
	
func _disable_previous_button() -> void:
	previous_button.disabled = true

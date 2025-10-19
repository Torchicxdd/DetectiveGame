class_name Meter extends Control

const MAX_Y_OFFSET = 115.0
const MAX_PERCENTAGE = 100.0

@onready var percentage_text = $Percentage/PercentageText
@onready var percentage_black_bg = $Percentage/PercentageBlackBg

func _ready() -> void:
	SignalBus.meter_percentage_changed.connect(update_meter_visuals)
	update_meter_visuals(Global.meter_percentage)

func update_meter_visuals(current_percentage: float) -> void:
	var safe_percentage = clamp(current_percentage, 0.0, MAX_PERCENTAGE)
	var y_offset = (MAX_Y_OFFSET * safe_percentage) / MAX_PERCENTAGE
	percentage_black_bg.position.y = -y_offset
	
	percentage_text.text = str(int(safe_percentage), '%')

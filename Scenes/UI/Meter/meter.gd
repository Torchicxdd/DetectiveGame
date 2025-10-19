extends Control

const MAX_Y_OFFSET = 115.0
const MAX_PERCENTAGE = 100.0

@onready var percentage_text = $Percentage/PercentageText
@onready var percentage_black_bg = $Percentage/PercentageBlackBg

func _ready() -> void:
	# 1. Connect this node's update function to the global signal.
	SignalBus.meter_percentage_changed.connect(update_meter_visuals)
	
	# 2. Call the function once at the start to initialize the UI.
	update_meter_visuals(Global.meter_percentage)

func update_meter_visuals(current_percentage: float) -> void:
	# 3. Ensure the value stays within a safe range (0 to 100).
	var safe_percentage = clamp(current_percentage, 0.0, MAX_PERCENTAGE)

	# 4. Recalculate the position.
	var y_offset = (MAX_Y_OFFSET * safe_percentage) / MAX_PERCENTAGE
	percentage_black_bg.position.y = -y_offset
	
	# 5. Update the text.
	percentage_text.text = str(int(safe_percentage), '%')

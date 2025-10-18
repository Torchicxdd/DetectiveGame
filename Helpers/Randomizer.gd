class_name Randomizer extends Node

var rng = RandomNumberGenerator.new()

var roll_result: bool = true

# Provide number between 0 and 100
func roll(percentage: float) -> void:
	if (percentage < 0 or percentage > 1):
		self.roll_result = false
		
	var num = rng.randf_range(0, 100)
	if num > percentage:
		self.roll_result = false
	else:
		self.roll_result = true

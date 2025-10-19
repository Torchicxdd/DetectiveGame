extends Node

var main: Main

var randomizer: Randomizer = Randomizer.new()

var grandma: Character = Grandma.new()
var junkie: Character = Junkie.new()
var little_child: Character = DonCandy.new()
var salaryman: Character = SalaryMan.new()
var teenager: Character = Teenager.new()

var meter_percentage: float = 50.0:
	set(new_value):
		# 3. Update the stored value.
		meter_percentage = new_value
		# 4. Immediately emit the signal with the new value as a parameter.
		SignalBus.emit(meter_percentage)

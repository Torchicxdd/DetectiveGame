extends Node

var main: Main

var randomizer: Randomizer = Randomizer.new()

var grandma: Character = Grandma.new()
var junkie: Character = Junkie.new()
var little_child: Character = DonCandy.new()
var salaryman: Character = SalaryMan.new()
var teenager: Character = Teenager.new()
var detective: Character = Detective.new()

var meter_percentage: float = 50.0:
	set(new_value):
		meter_percentage = new_value
		SignalBus.meter_percentage_changed.emit(meter_percentage)

# Enums for game stages
enum Stage {
	INTRO,
	ACT1
}

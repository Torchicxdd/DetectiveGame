extends Node

var main: Main

var randomizer: Randomizer = Randomizer.new()

var current_character: Character
var current_stage: Stage = Stage.INTRO

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

var power_moves_status = {
	PowerMoves.LICK: true,
	PowerMoves.GUN: true,
	PowerMoves.AURA: true,
	PowerMoves.TICKLE: true,
	PowerMoves.SILENT_TREATMENT: true,
}

var master_volume: float = 50.0
var sfx_volume: float = 50.0
var music_volume: float = 50.0

# Enums for game stages
enum Stage {
	INTRO,
	ACT1,
	SUSPICIOUS,
	OUTRO
}

enum PowerMoves {
	LICK,
	GUN,
	AURA,
	TICKLE,
	SILENT_TREATMENT
}

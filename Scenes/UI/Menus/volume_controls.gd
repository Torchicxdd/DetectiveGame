extends Control

@onready var music_slider_bg = $Sliders/TextureRect3
@onready var sfx_slider_bg = $Sliders/TextureRect2
@onready var master_slider_bg = $Sliders/TextureRect

@onready var music_slider = $Sliders/TextureRect3/MusicSlider
@onready var sfx_slider = $Sliders/TextureRect2/SFXSlider
@onready var master_slider = $Sliders/TextureRect/MasterSlider

func _ready() -> void:
	master_slider.value = Global.master_volume
	music_slider.value = Global.music_volume
	sfx_slider.value = Global.sfx_volume
	
	music_slider_bg.visible = false
	sfx_slider_bg.visible = false
	master_slider_bg.visible = false

func _on_music_pressed() -> void:
	if (music_slider_bg.visible):
		music_slider_bg.visible = false
	else:
		music_slider_bg.visible = true

func _on_sfx_pressed() -> void:
	if (sfx_slider_bg.visible):
		sfx_slider_bg.visible = false
	else:
		sfx_slider_bg.visible = true

func _on_master_pressed() -> void:
	if (master_slider_bg.visible):
		master_slider_bg.visible = false
	else:
		master_slider_bg.visible = true

func _on_master_slider_value_changed(value: float) -> void:
	Global.master_volume = value
	set_bus_volume("Master", value)

func _on_music_slider_value_changed(value: float) -> void:
	Global.music_volume = value
	set_bus_volume("Music", value)

func _on_sfx_slider_value_changed(value: float) -> void:
	Global.sfx_volume = value
	set_bus_volume("SFX", value)

func set_bus_volume(bus_name: String, value: float):
	var bus_index = AudioServer.get_bus_index(bus_name)
	
	if value == 0:
		AudioServer.set_bus_mute(bus_index, true)
	else:
		AudioServer.set_bus_mute(bus_index, false)
		var db = linear_to_db(value / 100.0)
		AudioServer.set_bus_volume_db(bus_index, db)

extends Control

@onready var music_slider = $Sliders/TextureRect3
@onready var sfx_slider = $Sliders/TextureRect2
@onready var master_slider = $Sliders/TextureRect

func _ready() -> void:
	music_slider.visible = false
	sfx_slider.visible = false
	master_slider.visible = false

func _on_music_pressed() -> void:
	if (music_slider.visible):
		music_slider.visible = false
	else:
		music_slider.visible = true

func _on_sfx_pressed() -> void:
	if (sfx_slider.visible):
		sfx_slider.visible = false
	else:
		sfx_slider.visible = true

func _on_master_pressed() -> void:
	if (master_slider.visible):
		master_slider.visible = false
	else:
		master_slider.visible = true

func _on_master_slider_value_changed(value: float) -> void:
	var bus_idx = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(bus_idx, linear_to_db(value / 100.0))

func _on_music_slider_value_changed(value: float) -> void:
	var bus_idx = AudioServer.get_bus_index("Music")
	AudioServer.set_bus_volume_db(bus_idx, linear_to_db(value / 100.0))

func _on_sfx_slider_value_changed(value: float) -> void:
	var bus_idx = AudioServer.get_bus_index("SFX")
	AudioServer.set_bus_volume_db(bus_idx, linear_to_db(value / 100.0))

extends Control

var journal_preload = preload("res://Scenes/UI/Journal/Journal.tscn")
var dialogue_viewer_preload = preload("res://Scenes/UI/DialogueViewer/DialogueViewer.tscn")
var item_viewer_preload = preload("res://Scenes/UI/ItemViewer/ItemViewer.tscn")
var scene_buttons_preload = preload("res://Scenes/UI/InterrogationRoomSceneButtons/InterrogationRoomSceneButtons.tscn")
var meter_preload = preload("res://Scenes/UI/Meter/Meter.tscn")
var interrogation_room_preload = preload("res://Scenes/World/InterrogationRoom/InterrogationRoom.tscn")
var character_select_preload = preload("res://Scenes/World/CharacterSelect/CharacterSelect.tscn")
var main_menu_preload = preload("res://Scenes/UI/Menus/MainMenu.tscn")

var interrogation_room_instance: InterrogationRoom
var character_select_room_instance: CharacterSelect
var scene_buttons: InterrogationRoomSceneButtons
var meter: Meter
var journal: Journal
var dialogue_viewer: DialogueViewer
var item_viewer: ItemViewer

@onready var switch_rooms = $Audios/SwitchingRooms
@onready var on_menu_click = $Audios/OnMenuClick

func _ready() -> void:
	SignalBus.connect("open_journal", Callable(self, "_open_journal"))
	SignalBus.connect("close_journal", Callable(self, "_close_journal"))
	SignalBus.connect("open_item_viewer", Callable(self, "_open_item_viewer"))
	SignalBus.connect("close_item_viewer", Callable(self, "_close_item_viewer"))
	SignalBus.connect("open_item_description", Callable(self, "_open_item_description"))
	SignalBus.switch_to_character_select_room.connect(_switch_to_character_select)
	SignalBus.switch_to_interrogation_room.connect(_switch_to_interrogation_room)
	SignalBus.switch_to_main_menu.connect(_switch_to_main_menu)
	SignalBus.on_menu_click.connect(_on_menu_clicked)

func _open_journal() -> void:
	if (journal == null):
		journal = journal_preload.instantiate() as Journal
	Global.main.addGUIScene(journal)

func _open_dialogue_viewer() -> void:
	if (dialogue_viewer == null):
		dialogue_viewer = dialogue_viewer_preload.instantiate() as DialogueViewer
	
	Global.main.addGUIScene(dialogue_viewer)

func _close_dialogue_viewer() -> void:
	if (dialogue_viewer != null):
		Global.main.deleteGUIScene(dialogue_viewer)

func _open_item_description(item: Evidence) -> void:
	if (item_viewer != null):
		item_viewer.open_item_description(item)
		return
	
	_open_item_viewer()
	item_viewer.open_item_description(item)

func _open_item_viewer() -> void:
	if (item_viewer == null):
		item_viewer = item_viewer_preload.instantiate() as ItemViewer
	Global.main.addGUIScene(item_viewer)

func _close_journal() -> void:
	if (journal != null):
		Global.main.deleteGUIScene(journal)
	
func _close_item_viewer() -> void:
	if (item_viewer != null):
		Global.main.deleteGUIScene(item_viewer)

func _instantiate_interrogation_room_scene_buttons() -> void:
	if (scene_buttons == null):
		scene_buttons = scene_buttons_preload.instantiate() as InterrogationRoomSceneButtons
	Global.main.addGUIScene(scene_buttons)

func _instantiate_meter() -> void:
	if (meter == null):
		meter = meter_preload.instantiate() as Meter
	Global.main.addGUIScene(meter)

func _switch_to_interrogation_room() -> void:
	# Set has talked to for current character
	switch_rooms.play()
	Global.current_character.stage_has_talked_to[Global.current_stage] = true
	
	if (character_select_room_instance != null):
		Global.main.deleteGUIScene(character_select_room_instance)
	if (interrogation_room_instance == null):
		interrogation_room_instance = interrogation_room_preload.instantiate() as InterrogationRoom
	interrogation_room_instance.set_background_texture(Global.current_character.interrogation_room_texture)
	Global.main.addGUIScene(interrogation_room_instance)
	
	_instantiate_interrogation_room_scene_buttons()
	_open_dialogue_viewer()
	_instantiate_meter()
	SignalBus.close_journal.emit()
	
func _switch_to_character_select() -> void:
	switch_rooms.play()
	if (interrogation_room_instance != null):
		Global.main.deleteGUIScene(interrogation_room_instance)
	if (character_select_room_instance == null):
		character_select_room_instance = character_select_preload.instantiate() as CharacterSelect
	Global.main.addGUIScene(character_select_room_instance)
	
	_instantiate_interrogation_room_scene_buttons()
	_instantiate_meter()
	_close_dialogue_viewer()
	SignalBus.close_journal.emit()
	
func _switch_to_main_menu() -> void:
	var main_menu_instance = main_menu_preload.instantiate()
	Global.main.addGUIScene(main_menu_instance)

func _on_menu_clicked() -> void:
	on_menu_click.play()

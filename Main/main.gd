class_name Main extends Node

# Change this scene to load a specific scene first
var main_menu = preload("res://Scenes/UI/Menus/MainMenu.tscn").instantiate()
var first_scene = preload("res://Scenes/World/InterrogationRoom/InterrogationRoom.tscn").instantiate()

func _init() -> void:
	Global.main = self

func _ready() -> void:
	SignalBus.load_game.connect(_load_game)
	addGUIScene(main_menu)
	
# World scene helper functions
func addWorldScene(scene: Node2D) -> void:
	if (scene not in $World.get_children()):
		$World.add_child(scene)
	else:
		scene.visible = true
		scene.move_to_front()
	
func removeWorldScene(scene: Node2D) -> void:
	if (scene in $World.get_children()):
		$World.remove_child(scene)
	
func hideWorldScene(scene: Node2D) -> void:
	if (scene in $World.get_children()):
		scene.visible = false

func showWorldScene(scene: Node2D) -> void:
	if (scene in $World.get_children()):
		scene.visible = true
		scene.move_to_front()

func deleteWorldScene(scene: Node2D) -> void:
	if (scene in $World.get_children()):
		scene.queue_free()

# GUI scene helper functions
func addGUIScene(scene: Control) -> void:
	if (scene not in $GUI.get_children()):
		$GUI.add_child(scene)
	else:
		scene.visible = true
		scene.move_to_front()
	
func removeGUIScene(scene: Control) -> void:
	if (scene in $GUI.get_children()):
		$GUI.remove_child(scene)
	
func hideGUIScene(scene: Control) -> void:
	if (scene in $GUI.get_children()):
		scene.visible = false

func showGUIScene(scene: Control) -> void:
	if (scene in $GUI.get_children()):
		scene.visible = true
		scene.move_to_front()

func deleteGUIScene(scene: Control) -> void:
	if (scene in $GUI.get_children()):
		scene.queue_free()

func _load_game() -> void:
	deleteGUIScene(main_menu)
	SignalBus.switch_to_character_select_room.emit()

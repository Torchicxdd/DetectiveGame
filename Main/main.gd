class_name Main extends Node

var first_scene = preload("res://Scenes/World/InterrogationRoom/InterrogationRoom.tscn").instantiate()

func _ready() -> void:
	Global.main = self
	addWorldScene(first_scene)
	
# World scene helper functions
func addWorldScene(scene: Node2D) -> void:
	if (scene not in $World.get_children()):
		$World.add_child(scene)
	
func removeWorldScene(scene: Node2D) -> void:
	if (scene in $World.get_children()):
		$World.remove_child(scene)
	
func hideWorldScene(scene: Node2D) -> void:
	if (scene in $World.get_children()):
		scene.visible = false

func showWorldScene(scene: Node2D) -> void:
	if (scene in $World.get_children()):
		scene.visible = true

func deleteWorldScene(scene: Node2D) -> void:
	if (scene in $World.get_children()):
		scene.queue_free()

# GUI scene helper functions
func addGUIScene(scene: Control) -> void:
	if (scene not in $GUI.get_children()):
		$GUI.add_child(scene)
	
func removeGUIScene(scene: Control) -> void:
	if (scene in $GUI.get_children()):
		$GUI.remove_child(scene)
	
func hideGUIScene(scene: Control) -> void:
	if (scene in $GUI.get_children()):
		scene.visible = false

func showGUIScene(scene: Control) -> void:
	if (scene in $GUI.get_children()):
		scene.visible = true

func deleteGUIScene(scene: Control) -> void:
	if (scene in $GUI.get_children()):
		scene.queue_free()

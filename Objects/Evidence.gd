class_name Evidence extends Node

func _init(itemName: String, desc: String, relations: Dictionary[Character, bool], image: Texture2D, is_unlocked = false) -> void:
	self.image = image
	self.ItemName = itemName
	self.desc = desc
	self.relations = relations
	self.is_unlocked = is_unlocked

var image: Texture2D
var desc: String
var ItemName: String
var relations: Dictionary[Character, bool] = {}
var is_unlocked: bool

class_name Character extends Node

func _init() -> void:
	for i in range(9):
		evidence_list.append(Evidence.new())

var character_name: String
var age: int
var height: int
var gender: String
var hair_color: String
var headshot: Texture2D
var evidence_list: Array[Evidence] = []

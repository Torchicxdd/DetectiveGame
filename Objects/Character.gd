class_name Character extends Node

# Variables
var character_name: String

# Rolls
var stage_max_clicks = {
	Global.Stage.INTRO: 0,
	Global.Stage.ACT1: 0
}

# Game States
var has_seen_intro: bool = false
var has_investigated_first_time: bool = false
var age: int
var height: int
var gender: String
var hair_color: String
var headshot: Texture2D
var interrogation_room_texture: Texture2D

# Dialogue Resources
var stage_dialogue_resources = {
	Global.Stage.INTRO: null,
	Global.Stage.ACT1: null,
}

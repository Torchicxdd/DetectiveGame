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

# Resources
var intro_resource: DialogueResource
var evidence_one_resource: DialogueResource

extends Node

var items_list: Array[Evidence] = [
	Evidence.new("Trash Can", "This is a description of the item for the trash can", {Global.grandma: false, Global.little_child: false, Global.teenager: false, Global.junkie: false}, preload("res://Items/TrashCan.png")),
	Evidence.new("Dentures", "", {Global.grandma: false}, preload("res://Items/GrandmaDenture.png")),
	Evidence.new("Beer Bottle", "", {Global.salaryman: false}, preload("res://Items/BeerEvidence.png")),
	Evidence.new("Bolt", "", {Global.grandma: false, Global.little_child: false}, preload("res://Items/BoltEvidence.png")),
	Evidence.new("Joint", "", {Global.junkie: false}, preload("res://Items/JointEvidence.png")),
]

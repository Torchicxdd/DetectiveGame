extends Node

var items_list: Array[Evidence] = [
	Evidence.new("Trash Can", "This is the trash can that you found kicked onto the pavement. This is the true victim of the crime scene. Sad and serving no more purpose in life. They don't even make them like these anymore.", {Global.grandma: true, Global.little_child: false, Global.teenager: false, Global.junkie: false}, preload("res://Items/TrashCan.png"), true),
	Evidence.new("Dentures", "This is a pair of dentures that was found in the trash can. How they got there? One can only guess.", {Global.grandma: false}, preload("res://Items/GrandmaDenture.png")),
	Evidence.new("Beer Bottle", "Someone was having a good time and decided to throw away their empty beer bottle in the trash. A real man would keep this bottle in hand, ready to return to the store for their free 50 cents.", {Global.salaryman: false}, preload("res://Items/BeerEvidence.png")),
	Evidence.new("Bolt", "A bolt? Inside a trash can? Impossible. Spare bolts remain in the toolbox, not inside a trash can. This might be the most suspicious piece of evidence I have ever seen.", {Global.grandma: false, Global.little_child: false}, preload("res://Items/BoltEvidence.png")),
	Evidence.new("Joint", "A joint inside the trash can is a metaphor for life — a symbol of the world’s indulgence, its lack of restraint. I’d never touch it myself, of course; it simply amuses me how easily people trade dignity for a moment’s haze, mistaking surrender for freedom.", {Global.junkie: false}, preload("res://Items/JointEvidence.png")),
]

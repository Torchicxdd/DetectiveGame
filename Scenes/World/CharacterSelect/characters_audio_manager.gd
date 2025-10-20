extends HBoxContainer

@onready var hover_sfx_player = $HoverEffectPlayer

func _ready():
	# 1. Loop through all children
	for child in get_children():
		
		# 2. Check if the child is a button
		if child is TextureButton:
			var button = child as TextureButton
			
			# 3. Connect the mouse_entered signal, passing the button itself
			button.mouse_entered.connect(_on_button_mouse_entered.bind(button))
			
			# 4. Connect the mouse_exited signal, passing the button itself
			button.mouse_exited.connect(_on_button_mouse_exited.bind(button))

func _on_button_mouse_entered(button: TextureButton):
	print("Mouse entered: " + button.name)
	
	# Check if the sound is already playing to prevent re-triggering (spam)
	if not hover_sfx_player.is_playing():
		hover_sfx_player.play()

func _on_button_mouse_exited(button: TextureButton):
		print("Mouse exited: " + button.name)

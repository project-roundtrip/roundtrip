extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_try_again_pressed():
	get_tree().change_scene_to_file("res://scenes/level/level.tscn")
	
func _on_BackToMainMenu_pressed():
	get_tree().change_scene_to_file("res://scenes/mainmenu/mainmenu.tscn")

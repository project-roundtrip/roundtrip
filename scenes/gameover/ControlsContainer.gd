extends VBoxContainer

var first_focus = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$TryAgain.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func _on_try_again_pressed():
	get_tree().change_scene_to_file("res://scenes/level/level.tscn")
	
func _on_BackToMainMenu_pressed():
	get_tree().change_scene_to_file("res://scenes/mainmenu/mainmenu.tscn")

func _on_button_focus_entered():
	if first_focus:
		first_focus = false
	else:
		$click.play()

func _on_try_again_mouse_entered():
	$TryAgain.grab_focus()

func _on_back_to_main_menu_mouse_entered():
	$BackToMainMenu.grab_focus()

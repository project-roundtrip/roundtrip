extends VBoxContainer

var first_focus = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$StartButton.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level/level.tscn")


func _on_help_button_pressed():
	get_tree().change_scene_to_file("res://scenes/help/help.tscn")


func _on_homepage_button_pressed():
	OS.shell_open("https://github.com/project-roundtrip/roundtrip")


func _on_exit_button_pressed():
	get_tree().quit()


func _on_button_focus_entered():
	if first_focus:
		first_focus = false
	else:
		$click.play()


func _on_start_button_mouse_entered():
	$StartButton.grab_focus()


func _on_help_button_mouse_entered():
	$HelpButton.grab_focus()


func _on_homepage_button_mouse_entered():
	$HomepageButton.grab_focus()


func _on_exit_button_mouse_entered():
	$ExitButton.grab_focus()

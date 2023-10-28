extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	$StartButton.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level/level.tscn")


func _on_help_button_pressed():
	get_tree().change_scene_to_file("res://scenes/help/help.tscn")


func _on_credits_button_pressed():
	get_tree().change_scene_to_file("res://scenes/credits/credits.tscn")

func _on_exit_button_pressed():
	get_tree().quit()


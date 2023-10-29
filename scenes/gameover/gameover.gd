extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var unformatted_scoreString = "[center]Score of last run: [b]%s[/b]"
	var formatted_scoreString = unformatted_scoreString % GlobalVar.lastRunScore
	$"BackgroundGameover/MarginContainer/VBoxContainer/HBoxContainer/HighscoreThisRun".text = formatted_scoreString

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("exit"):
		get_tree().change_scene_to_file("res://scenes/mainmenu/mainmenu.tscn")

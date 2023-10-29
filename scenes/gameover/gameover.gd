extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var unformatted_scoreString = "[center]Score of last run - [b]%s[/b]"
	var formatted_scoreString = unformatted_scoreString % GlobalVar.lastRunScore
	$"BackgroundGameover/MarginContainer/VBoxContainer/HBoxContainer/HighscoreThisRun".text = formatted_scoreString

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

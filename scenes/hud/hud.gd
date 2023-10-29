extends Control

var scoreText_unformatted = "SCORE - %s"
var score = 0
var health = 0
var hearts = []


func updateScore(progress):
	score += 100 * (1 - progress)
	var scoreText_formatted = scoreText_unformatted % ceil(score)
	get_node("MarginContainer/VBoxContainer/RichTextLabel").text = scoreText_formatted 

func render_hearts():
	for i in hearts.size():
		var currentHeart = hearts[i]
		if i < health:
			currentHeart.self_modulate = Color(1, 1, 1)
		else:
			currentHeart.self_modulate = Color(0.25, 0.25, 0.25)


func remove_health():
	health -= 1
	render_hearts()
	if health == 0:
		# TODO: add gameover state
		get_tree().change_scene_to_file("res://scenes/mainmenu/mainmenu.tscn")
		pass
	
	
# Called when the node enters the scene tree for the first time.
func _ready():
	score = 0
	hearts = [
		$"MarginContainer/VBoxContainer/HBoxContainer/heart1",
		$"MarginContainer/VBoxContainer/HBoxContainer/heart2",
		$"MarginContainer/VBoxContainer/HBoxContainer/heart3",
		$"MarginContainer/VBoxContainer/HBoxContainer/heart4",
		$"MarginContainer/VBoxContainer/HBoxContainer/heart5"
	]
	health = hearts.size()
	render_hearts()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

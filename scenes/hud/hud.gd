extends Control

var health
var hearts

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
	hearts = [
		$"MarginContainer/HBoxContainer/heart1",
		$"MarginContainer/HBoxContainer/heart2",
		$"MarginContainer/HBoxContainer/heart3",
		$"MarginContainer/HBoxContainer/heart4",
		$"MarginContainer/HBoxContainer/heart5"
	]
	
	health = hearts.size()
	render_hearts()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

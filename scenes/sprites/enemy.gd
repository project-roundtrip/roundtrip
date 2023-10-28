extends Node2D

class_name Enemy

@export var speed = 50

var bg
var enemy_name
var vulnerable

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if bg.rotateNow:
		get_parent().set_progress(get_parent().get_progress() + speed * delta * 3)
	
	if get_parent().get_progress_ratio() == 1:
		remove()

func kill(element):
	if element == vulnerable:
		print("killing " + enemy_name + " with " + element)
		remove()
	else:
		print("can't kill " + enemy_name + " with " + element)

func remove():
	var path = get_parent().get_parent()
	get_node("/root/level/StaircaseBackground/enemies").remove_child(path)
	path.queue_free()
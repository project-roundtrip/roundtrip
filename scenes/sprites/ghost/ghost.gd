extends Node2D

@export var speed = 50

var bg

# Called when the node enters the scene tree for the first time.
func _ready():
	bg = get_node("/root/level/StaircaseBackground")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if bg.rotateNow:
		get_parent().set_progress(get_parent().get_progress() + speed * delta * 3)
	
	if get_parent().get_progress_ratio() == 1:
		var path = get_parent().get_parent()
		get_node("/root/level/StaircaseBackground/enemies").remove_child(path)
		path.queue_free()

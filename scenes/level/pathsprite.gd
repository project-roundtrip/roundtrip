extends Area2D

@export var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_parent().set_progress(get_parent().get_progress() + speed * delta)
	pass
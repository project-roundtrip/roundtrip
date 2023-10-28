extends Sprite2D

var lastRotate = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	lastRotate += delta
	if lastRotate > 0.05:
		rotate(0.1)
		for child in $"enemies".get_children():
			child.rotate(0.1)
		lastRotate = 0
	pass

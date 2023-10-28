extends Sprite2D

var lastRotate = 0
var rotateNow = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	lastRotate += delta
	rotateNow = false
	
	if lastRotate >= delta * 3 and lastRotate <= delta * 4:
		rotateNow = true
	if lastRotate >= delta * 6:
		rotate(delta * 6)
		for child in $"enemies".get_children():
			child.rotate(delta * 6)
		lastRotate = 0
		rotateNow = true
	pass

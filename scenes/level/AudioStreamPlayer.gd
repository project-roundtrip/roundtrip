extends AudioStreamPlayer

@onready var audioIntro = preload("res://assets/sounds/Hit n Smash_intro.mp3")
@onready var audioLoop = preload("res://assets/sounds/Hit n Smash_loop.mp3")

# Called when the node enters the scene tree for the first time.
func _ready():
	self.stream = audioIntro
	self.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_finished():
	self.stream = audioLoop
	self.play()

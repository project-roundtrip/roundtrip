extends Node2D

@onready var path = preload("res://scenes/level/path.tscn")

var timer
var lowerLimit = 2.0
var upperLimit = 3.0

# Called when the node enters the scene tree for the first time.
func _ready():
	timer = get_node("Timer")
	timer.start(randf_range(lowerLimit, upperLimit))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var tempPath = path.instantiate()
	$"../enemies".add_child(tempPath)

	lowerLimit *= 0.95;
	upperLimit *= 0.95

	if lowerLimit < 0.35:
		lowerLimit = 0.35
	if upperLimit < 0.75:
		upperLimit = 0.75

	timer.start(randf_range(lowerLimit, upperLimit))

extends Node2D

@onready var path = preload("res://scenes/level/path.tscn")

@onready var enemies = [
	preload("res://scenes/sprites/bat/bat.tscn"),
	preload("res://scenes/sprites/cyclops/cyclops.tscn"),
	preload("res://scenes/sprites/darkmage/darkmage.tscn"),
	preload("res://scenes/sprites/ferris/ferris.tscn"),
	preload("res://scenes/sprites/ghost/ghost.tscn"),
	preload("res://scenes/sprites/knight/knight.tscn"),
	preload("res://scenes/sprites/mimic/mimic.tscn"),
	preload("res://scenes/sprites/rat/rat.tscn"),
]

var timer
var bg
var lowerLimit = 4.0
var upperLimit = 6.0

# Called when the node enters the scene tree for the first time.
func _ready():
	timer = get_node("Timer")
	bg = get_parent()
	timer.start(3.7)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var tempPath = path.instantiate()
	tempPath.get_child(0).add_child(enemies.pick_random().instantiate())
	tempPath.rotation = bg.rotation
	$"../enemies".add_child(tempPath)

	lowerLimit *= 0.97;
	upperLimit *= 0.97

	if lowerLimit < 0.35:
		lowerLimit = 0.35
	if upperLimit < 0.75:
		upperLimit = 0.75

	timer.start(randf_range(lowerLimit, upperLimit))

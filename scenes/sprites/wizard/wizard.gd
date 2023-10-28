extends Node2D

var actions = []
var combo_timer
var recover_timer
var sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	combo_timer = get_node("Combo_Timer")
	recover_timer = get_node("RecoverTimer")
	sprite = get_node("Area2D/CollisionShape2D/Sprite2D")
	combo_timer.timeout.connect(_on_combo_timeout)
	recover_timer.timeout.connect(on_recover_timeout)

func get_input():
	if Input.is_action_just_pressed("Earth"):
		actions.append("earth")
	if Input.is_action_just_pressed("Fire"):
		actions.append("fire")
	if Input.is_action_just_pressed("Wind"):
		actions.append("wind")
	if Input.is_action_just_pressed("Light"):
		actions.append("light")

	if combo_timer.is_stopped() and len(actions) > 0:
		combo_timer.start(0.2)

func _on_combo_timeout():
	if "fire" in actions and "earth" in actions:
		attack("comet")
	elif "fire" in actions and "light" in actions:
		attack("solar flare")
	elif "wind" in actions and "earth" in actions:
		attack("poison")
	elif "wind" in actions and "light" in actions:
		attack("lightning")
	elif ["wind", "wind"] == actions:
		attack("ice")
	elif "wind" in actions:
		attack("wind")
	elif "light" in actions:
		attack("light")
	elif "fire" in actions:
		attack("fire")
	elif "earth" in actions:
		attack("earth")
	actions = []

func attack(element):
	print("attack with " + element)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_input()


func _on_area_2d_area_entered(area):
	print("collision detected");
	area.hide();
	sprite.self_modulate = Color(1,0,0);
	recover_timer.start(0.2)

func on_recover_timeout():
	sprite.self_modulate = Color(1,1,1);


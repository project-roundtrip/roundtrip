extends Node2D

var actions = []
var combo_timer
var recover_timer
var sprite
var spells
var animationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	combo_timer = get_node("Combo_Timer")
	recover_timer = get_node("RecoverTimer")
	sprite = get_node("Area2D/CollisionShape2D/Sprite2D")
	combo_timer.timeout.connect(_on_combo_timeout)
	recover_timer.timeout.connect(on_recover_timeout)
	spells = get_node("/root/level/spells")
	animationPlayer = get_node("Area2D/CollisionShape2D/AnimationPlayer")

func get_input():
	if Input.is_action_just_pressed("exit"):
		get_tree().change_scene_to_file("res://scenes/mainmenu/mainmenu.tscn")
		
	if Input.is_action_just_pressed("Earth"):
		actions.append("earth")
		animationPlayer.play("cast_magic")
	if Input.is_action_just_pressed("Fire"):
		actions.append("fire")
		animationPlayer.play("cast_magic")
	if Input.is_action_just_pressed("Wind"):
		actions.append("wind")
		animationPlayer.play("cast_magic")
	if Input.is_action_just_pressed("Light"):
		actions.append("light")
		animationPlayer.play("cast_magic")

	if combo_timer.is_stopped() and len(actions) > 0:
		combo_timer.start(0.2)
	
	if len(actions) > 0:
		update_spell_visibility()

func _on_combo_timeout():
	if "fire" in actions and "earth" in actions:
		attack("comet")
	elif "fire" in actions and "light" in actions:
		attack("solar flare")
	elif "wind" in actions and "earth" in actions:
		attack("poison")
	elif "wind" in actions and "light" in actions:
		attack("lightning")
	elif "wind" in actions:
		attack("wind")
	elif "light" in actions:
		attack("light")
	elif "fire" in actions:
		attack("fire")
	elif "earth" in actions:
		attack("earth")
	actions = []
	
	update_spell_visibility()

func attack(element):
	var enemies = get_node("/root/level/StaircaseBackground/enemies")
	var target = null;
	for enemy in enemies.get_children():
		if enemy is Node2D:
			if target == null:
				target = enemy
			else:
				var enemyProgress = enemy.get_child(0).get_progress()
				var targetProgress = target.get_child(0).get_progress()
				if enemyProgress > targetProgress:
					target = enemy
	
	if target != null:
		target.get_child(0).get_child(0).kill(element)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_input()


func _on_area_2d_area_entered(area):
	area.hide();
	sprite.self_modulate = Color(1,0,0);
	recover_timer.start(0.2)
	get_node("/root/level/hud").remove_health()

func on_recover_timeout():
	sprite.self_modulate = Color(1,1,1);

func update_spell_visibility():
	for spell in spells.get_children():
		if spell.name in actions:
			spell.self_modulate = Color(1,1,1,1)
		else:
			spell.self_modulate = Color(1,1,1,0.1)

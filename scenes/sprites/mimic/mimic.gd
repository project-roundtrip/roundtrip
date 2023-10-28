extends Enemy

func _ready():
	enemy_name = "mimic"
	vulnerable = "fire"
	bg = get_node("/root/level/StaircaseBackground")

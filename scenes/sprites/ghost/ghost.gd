extends Enemy

func _ready():
	enemy_name = "ghost"
	vulnerable = "solar flare"
	bg = get_node("/root/level/StaircaseBackground")

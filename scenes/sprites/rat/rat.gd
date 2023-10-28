extends Enemy

func _ready():
	enemy_name = "rat"
	vulnerable = "light"
	bg = get_node("/root/level/StaircaseBackground")

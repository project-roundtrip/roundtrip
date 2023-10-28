extends Enemy

func _ready():
	enemy_name = "knight"
	vulnerable = "lightning"
	bg = get_node("/root/level/StaircaseBackground")

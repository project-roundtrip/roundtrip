extends Enemy

func _ready():
	enemy_name = "ferris"
	vulnerable = "earth"
	bg = get_node("/root/level/StaircaseBackground")

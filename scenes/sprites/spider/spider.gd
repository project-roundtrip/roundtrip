extends Enemy

func _ready():
	enemy_name = "spider"
	vulnerable = "ice"
	bg = get_node("/root/level/StaircaseBackground")

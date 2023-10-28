extends Enemy

func _ready():
	enemy_name = "bat"
	vulnerable = "wind"
	bg = get_node("/root/level/StaircaseBackground")

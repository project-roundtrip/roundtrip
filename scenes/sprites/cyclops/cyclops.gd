extends Enemy

func _ready():
	enemy_name = "cyclops"
	vulnerable = "comet"
	bg = get_node("/root/level/StaircaseBackground")

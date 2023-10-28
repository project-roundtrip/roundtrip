extends Enemy

func _ready():
	enemy_name = "dark mage"
	vulnerable = "poison"
	bg = get_node("/root/level/StaircaseBackground")

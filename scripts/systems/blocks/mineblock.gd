extends Block
class_name MineBlock

@export var damage: float = 10;

func on_hit(target):

	print("damage", damage)
	destroy()

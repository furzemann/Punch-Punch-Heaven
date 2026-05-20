extends Block
class_name HealBlock

@export var heal: float = 10;

func on_touch(target):

	print("heal:", heal)
	destroy()

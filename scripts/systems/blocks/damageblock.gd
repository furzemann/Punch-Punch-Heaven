extends Block
class_name DamageBlock

@export var damage: float = 10;

func on_touch(target):

	print("damage", damage)
	destroy()

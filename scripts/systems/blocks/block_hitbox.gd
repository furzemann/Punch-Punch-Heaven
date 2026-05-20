extends Area2D
class_name Hitbox

signal touched(target)

func _ready():

	area_entered.connect(_on_area_entered)


func _on_area_entered(area):

	print("hitbox touched:", area.name)

	touched.emit(area)

extends Node2D
class_name Block

var grid_x
var grid_y
var value

const CELL_SIZE = 32
const GRID_OFFSET = Vector2(200,100)

@export var hitbox : Area2D
@export var hurtbox : Area2D


func _ready():

	if hitbox:
		hitbox.touched.connect(_on_touched)

	if hurtbox:
		hurtbox.hit.connect(_on_hit)


func update_position():

	position = GRID_OFFSET + Vector2(
		grid_x * CELL_SIZE,
		grid_y * CELL_SIZE
	)


func setup():
	pass


func execute():
	pass


func on_hit(attacker):
	pass


func on_touch(target):
	pass


func destroy():
	queue_free()


func _on_hit(attacker):

	print("Block hit by:", attacker.name)

	on_hit(attacker)


func _on_touched(target):

	print("Block touched:", target.name)

	on_touch(target)

extends Area2D

var grid_x
var grid_y

const CELL_SIZE=64
const GRID_OFFSET = Vector2(200,100)
enum Type{
	DAMAGE,
	HEAL,
	MINE
}

@export var type : Type
var value


func update_position():

	position= GRID_OFFSET + Vector2(
		grid_x*CELL_SIZE,
		grid_y*CELL_SIZE 
	)


func setup(new_type):

	type=new_type

	match type:

		Type.DAMAGE:
			value=randi_range(5,15)
			$Sprite2D.modulate=Color.RED

		Type.HEAL:
			value=randi_range(5,10)
			$Sprite2D.modulate=Color.GREEN

		Type.MINE:
			value=20
			$Sprite2D.modulate=Color.BLACK



func execute():

	match type:

		Type.DAMAGE:
			print("damage")

		Type.HEAL:
			print("heal")

		Type.MINE:
			print("boom")


	queue_free()

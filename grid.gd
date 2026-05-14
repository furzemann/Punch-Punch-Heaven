extends Node2D

@export var WIDTH = 8
@export var HEIGHT = 12
@export var CELL_SIZE = 64

@export var tick = 0.8
@export var blocks_available : Array[PackedScene]

var timer = 0
var grid = []


func _ready():

	for y in range(HEIGHT):
		grid.append([])

		for x in range(WIDTH):
			grid[y].append(null)


func _process(delta):

	timer += delta

	if timer >= tick:

		timer -= tick

		move_grid()


func move_grid():

	# bottom row reached fail point

	for x in range(WIDTH):

		if grid[HEIGHT-1][x]:
			grid[HEIGHT-1][x].execute()


	# IMPORTANT:
	# move bottom upward

	for y in range(HEIGHT-2,-1,-1):

		for x in range(WIDTH):

			var block = grid[y][x]

			if block:

				grid[y][x] = null

				block.grid_y += 1

				grid[y+1][x] = block

				block.update_position()


	spawn_line()



func spawn_line():

	for x in range(WIDTH):

		if randf() < .7:

			var scene = blocks_available.pick_random()

			var block = scene.instantiate()

			add_child(block)

			block.grid_x = x
			block.grid_y = 0

			grid[0][x]=block

			block.update_position()

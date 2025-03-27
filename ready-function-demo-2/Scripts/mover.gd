extends Sprite2D


############################################################################################################
####																									####
####	This script creates movers. These movers will simply move towards the rings and disappear.		####
####	The _ready function runs the first frame the object is in the scene.							####
####	The _ready function will run for each individual mover that spawns.								####
####	The _ready function for this script needs to colorize the mover, find its destination,			####
####		and start moving, in that order. (I have created functions to accomplish these.)			####
####	Add the necessary function calls to the _ready function.										####
####																									####
####											GOOD LUCK!												####
####																									####
############################################################################################################


func _ready() -> void:
	# Add your code here
	pass






















####################################################################################################
####																							####
####																							####
####								IGNORE CODE BEYOND THIS POINT								####
####																							####
####																							####
####################################################################################################






















var color_index: int = 0
var destination: Vector2


func colorize():
	match color_index:
		0:
			material.set("shader_parameter/color", Vector3(1.5, 0, 0))
		1:
			material.set("shader_parameter/color", Vector3(0, 1.5, 0))
		2:
			material.set("shader_parameter/color", Vector3(0, 0, 1.5))


func fade_out():
	var tween = create_tween()
	tween.tween_property(material, "shader_parameter/alpha", 0, 1)
	await tween.finished
	queue_free()


func find_destination():
	var x: float
	var y = 64
	match color_index:
		0:
			x = 1152 * .1
		1:
			x = 1152 * .5
		2:
			x = 1152 * .9
	destination = Vector2(x, y)


func start_motion():
	var tween = create_tween()
	tween.tween_property(self, "position", destination, 3)
	await tween.finished
	fade_out()

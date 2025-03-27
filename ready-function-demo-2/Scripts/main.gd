extends Node2D

############################################################################################################
####																									####
####	This program shows that the _ready function runs on each individual instance of an object.		####
####	In this game, you'll spawn movers that travel to the 3 rings you see.							####
####	You can spawn in red, green, or blue movers by pressing the corresponding keys.					####
####	(1 or R for red, 2 or G for green, 3 or B for blue.)											####
####	The _ready function in question is in the mover.gd script.										####
####																									####
############################################################################################################




















####################################################################################################
####																							####
####																							####
####								IGNORE CODE BEYOND THIS POINT								####
####																							####
####																							####
####################################################################################################






















@onready var pf_mover = preload("res://Scenes/mover.tscn")

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed() and not event.is_echo():
		match event.physical_keycode:
			KEY_ESCAPE:
				get_tree().quit()
			KEY_1, KEY_R:
				var mover = pf_mover.instantiate()
				mover.color_index = 0
				mover.position = $Spawner.position
				add_child(mover)
			KEY_2, KEY_G:
				var mover = pf_mover.instantiate()
				mover.color_index = 1
				mover.position = $Spawner.position
				add_child(mover)
			KEY_3, KEY_B:
				var mover = pf_mover.instantiate()
				mover.color_index = 2
				mover.position = $Spawner.position
				add_child(mover)

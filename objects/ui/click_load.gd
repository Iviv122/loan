extends Node2D

@export var count : int = 0
@export var scene : String 

func _input(event):
	if event.is_action_pressed("m1"):
		count -= 1
		if count <= 0:
			_update()

func _update() -> void:
	TransitionManager.load_scene(scene)

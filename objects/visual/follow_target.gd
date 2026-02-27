extends Camera2D

@export var target : Node2D

func _process(delta):
	global_position.y = target.global_position.y 

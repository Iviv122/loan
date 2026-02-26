extends Node2D

@export var target : Node2D

func _process(delta: float) -> void:
	global_position.y = target.global_position.y

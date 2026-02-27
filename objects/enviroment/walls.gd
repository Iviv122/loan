extends StaticBody2D 
class_name Walls

@export var charater_to_follow : Node2D
@export var move_period : int = 256

func _process(delta: float) -> void:
	if charater_to_follow.global_position.y > 0:
		global_position.y = (int(charater_to_follow.global_position.y) / move_period)*move_period
	else:
		global_position.y = (int(abs(charater_to_follow.global_position.y)) / move_period)*-move_period

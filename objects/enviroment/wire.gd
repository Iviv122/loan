extends Area2D 
class_name Wire

func _ready() -> void:
	body_entered.connect(kill)

func kill(body : Node2D) -> void:
	if body is Bread:
		body.die()

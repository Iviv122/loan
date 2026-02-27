extends Area2D 
class_name Coin

func _ready() -> void:
	body_entered.connect(pickup)

func pickup(_body : Node2D) -> void:
	queue_free()

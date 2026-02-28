extends Area2D 
class_name Coin

func _ready() -> void:
	body_entered.connect(pickup)

func pickup(_body : Node2D) -> void:
	
	if _body is Bread:
		_body.coin()
	AudioManager.coin_sound.play()
	queue_free()

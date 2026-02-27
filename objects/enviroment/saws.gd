class_name Saws
extends Wire

@export var speed : float = 20
@export var speed_gain : float = 0.03


func _process(delta):
    global_position.y += speed*delta
    speed += speed_gain
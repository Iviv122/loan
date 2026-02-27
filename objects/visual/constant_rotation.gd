extends Sprite2D

@export var speed : float = 15

func _ready():
    rotation += randf_range(-15,15)
    speed += randf_range(-0.25,0.25)

func _process(delta):
    rotation += delta*TAU*speed
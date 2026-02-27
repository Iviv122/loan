class_name Saws
extends Wire

@export var speed : float = 50
@export var speed_gain : float = 0.03

@export var sprites : Array[Sprite2D]


var target_y : float

func on_ready() -> void:
	target_y = global_position.y
	for i in sprites:
		i.rotation += randf_range(-15,15)

func _process(delta):
	target_y += speed * delta
	speed += speed_gain


	global_position.y = lerp(global_position.y, target_y, 5 * delta)

	for i in sprites:
		i.rotation += 2*delta

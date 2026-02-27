extends Node
class_name StartGame

@export var player : Bread 

@export var bridge : StaticBody2D 

@export var to_activate : Array[Node2D]

func _ready() -> void:
	for i in to_activate:
		i.set_process(false)

	player.pushed.connect(start)

func start() -> void:
	for i in to_activate:
		i.set_process(true)

	bridge.set_collision_layer_value(1,false)

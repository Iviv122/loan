extends AnimatedSprite2D 
class_name Restarter

@export var camera : Camera2D
@export var scene_to_load : String
@export var bread : Bread

@export var speed : float
@export var coffset : float = 2000

var t : float= 0

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("m1") && t >= 0.5:
		restart()

func _ready() -> void:
	bread.died.connect(start)
	set_process(false)
	visible = false

func start() -> void:
	set_process(true)
	visible = true
	global_position.y += camera.global_position.y-coffset
	play()


func restart() -> void:
	TransitionManager.load_scene(scene_to_load)

func _process(delta):
	global_position = global_position.lerp(camera.global_position,t)
	t = min(t+delta,1)

extends Node2D
class_name Spawner


@export var bread : Bread

@export var dist_to_pass : float = 1000
@export var add_dist : float = 3000 # max segment height to avoid overlap

@export var segments : Array[PackedScene] # segments

var spawn_pos : float = 0 # y
var add_spawn_dist : float = 0

var dist_to_pass_target : float = 0

var id : int = 0

var initialized : Array[Node2D]= []

func _ready():
	add_spawn_dist = dist_to_pass + add_dist/2
	spawn_pos = add_spawn_dist

	dist_to_pass_target += dist_to_pass/2 + add_dist

	spawn()

func spawn() -> void:
	
	if initialized.size() > 2:
		initialized.front()
		initialized.pop_front()

	id+=1

	var seg : Segment= segments.pick_random().instantiate()
	seg.id = id

	seg.global_position.y = spawn_pos 

	await get_tree().process_frame

	initialized.append(seg)
	get_tree().current_scene.add_child(seg)

	spawn_pos += add_spawn_dist + add_dist/2

func _process(delta: float) -> void:
	if is_instance_valid(bread):
		if bread.global_position.y > dist_to_pass_target:
			spawn()

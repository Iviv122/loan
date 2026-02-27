extends Node2D
class_name Spawner


@export var bread : Bread

@export var dist_to_pass : float = 1250
@export var add_dist : float = 3000 # max segment height to avoid overlap

@export var segments : Array[PackedScene] # segments

var spawn_pos : float = 0 # y
var add_spawn_dist : float = 0

var dist_to_pass_target : float = 0

var id : int = 0

var initialized : Array[Node2D]= []
var queue : Array[PackedScene] = []

func populate() -> void:
	for i in segments:
		queue.append(i)

func _ready():
	add_spawn_dist = dist_to_pass + add_dist/2
	spawn_pos = add_spawn_dist

	dist_to_pass_target += dist_to_pass/2 + add_dist

	populate()
	spawn()

func spawn() -> void:
	
	if initialized.size() > 3:
		var t : Node2D = initialized.front()
		initialized.pop_front()
		t.queue_free()
		print("despawned")

	id+=1

	if queue.size() <= 0:
		populate()

	var pick = queue.pick_random()
	queue.erase(pick)
	var seg : Segment= pick.instantiate()

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
			print("spawned")
			dist_to_pass_target +=dist_to_pass/2 + add_dist

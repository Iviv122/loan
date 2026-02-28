extends CanvasLayer 
class_name Transitor

@export var panel : Panel

var is_loading = false

var t : Tween 
var trans_time : float = 0.5

func _ready():
	fade_out()

func fade_in() -> void:
	if t:
		t.kill()

	t = create_tween()
	t.tween_property(panel,"modulate:a",1,trans_time)

func fade_out() -> void:
	if t:
		t.kill()

	t = create_tween()
 
	t.tween_property(panel,"modulate:a",0,trans_time)

func load_scene(scene : String) -> void:
	if is_loading:
		return

	is_loading = true
	fade_in()
	await get_tree().create_timer(trans_time).timeout
	get_tree().change_scene_to_file(scene)
	is_loading = false 

	fade_out()

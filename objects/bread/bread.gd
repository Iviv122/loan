extends RigidBody2D 
class_name Bread


@export var throw_power : float = 100
@export var line_render : Line2D
@export var max_power : float = 500

@export var death_effect : Array[PackedScene]

signal died()
signal pushed()
signal got_coin()

func coin() -> void:
	got_coin.emit()

func die() -> void:
	died.emit()

	for i in death_effect:
		var ef : GPUParticles2D= i.instantiate()
		ef.global_position = global_position
		get_tree().current_scene.add_child(ef)

	AudioManager.pop_sound.play()

	queue_free()

func push(m_pos : Vector2) -> void:

	AudioManager.throw_sound.play()
	var dir : Vector2 = (global_position-m_pos)

	var power = min(dir.length(),max_power)
	print(power)

	apply_impulse(dir.normalized()*throw_power*power*0.6)
	apply_impulse(dir.normalized()*throw_power*power*0.4,m_pos)

	pushed.emit()


func _input(event : InputEvent) -> void:
	if event.is_action_pressed("m1"):
		push(get_global_mouse_position())
		

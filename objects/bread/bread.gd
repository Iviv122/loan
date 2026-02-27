extends RigidBody2D 
class_name Bread


@export var throw_power : float = 100
@export var line_render : Line2D
@export var max_power : float = 500

@export var death_effect : Array[PackedScene]

signal died()
signal pushed()

func die() -> void:
	died.emit()

	for i in death_effect:
		var ef : GPUParticles2D= i.instantiate()
		ef.global_position = global_position
		get_tree().root.add_child(ef)

	queue_free()

func push(m_pos : Vector2) -> void:

	var dir : Vector2 = (global_position-m_pos)

	var power = min(dir.length(),max_power)
	print(power)

	apply_force(dir.normalized()*throw_power*power)		

	pushed.emit()


func _input(event : InputEvent) -> void:
	if event.is_action_pressed("m1"):
		push(get_global_mouse_position())
		

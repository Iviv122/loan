extends RigidBody2D 
class_name Bread


@export var throw_power : float = 100
@export var line_render : Line2D
@export var max_power : float = 500

signal died()

func die() -> void:
	died.emit()
	queue_free()

func _input(event : InputEvent) -> void:
	if event.is_action_pressed("m1"):
		
		var m_pos : Vector2 = get_global_mouse_position()
		var dir : Vector2 = (global_position-m_pos)

		var power = min(dir.length(),max_power)
		print(power)

		apply_force(dir.normalized()*throw_power*power,m_pos)		
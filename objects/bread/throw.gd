extends RigidBody2D 

@export var throw_power : float = 100

@export var line_render : Line2D

func _input(event : InputEvent):
	if event.is_action_pressed("m1"):
		
		var m_pos : Vector2 = get_global_mouse_position()
		var dir : Vector2 = (global_position-m_pos)
		apply_force(dir*throw_power,m_pos)		
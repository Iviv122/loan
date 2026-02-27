extends Node2D 
class_name Segment

var id : int = 0

func _ready():
	var l = Label.new()

	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER

	l.text = str(id)
	l.scale = Vector2(8,8)

	l.global_position.y -= 2000
	add_child(l)

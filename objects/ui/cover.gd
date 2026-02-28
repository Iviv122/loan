extends Node2D

@export var count : int = 0

func _input(event):
    if event.is_action_pressed("m1"):
        count -= 1
        if count == 0:
            _update()

func _update() -> void:
    var t : Tween = create_tween()
    t.tween_property(self,"self_modulate:a",0,0.5)
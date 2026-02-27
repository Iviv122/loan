extends Camera2D

@export var target : Bread 

func _ready():
	target.died.connect(died)

func died() -> void:
	target = null

func _process(delta):
	if is_instance_valid(target):
		global_position.y = target.global_position.y 

extends Camera2D

@export var target : Bread 
@export var yoffset : float

func _ready():
	target.died.connect(died)

func died() -> void:
	target = null

func _process(_delta):
	if is_instance_valid(target):
		global_position.y = target.global_position.y+yoffset

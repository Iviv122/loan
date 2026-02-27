extends GPUParticles2D
class_name Particle

func _ready():
    restart()
    await get_tree().create_timer(lifetime).timeout
    queue_free()
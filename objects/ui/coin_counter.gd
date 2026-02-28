extends Label
class_name CoinCounter

@export var bread : Bread
@export var target : int = 1
@export var win_comic : String
var count : int = 0


func _ready():
    text = '0'
    bread.got_coin.connect(update)

func update() -> void:
    count += 1
    if count >= target:
        win()
    text = str(count)

func win() -> void:
    TransitionManager.load_scene(win_comic) 
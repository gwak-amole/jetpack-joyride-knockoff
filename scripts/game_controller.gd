extends Node

@export var hp = 3
@export var hpcount: Node
var game_over = false

func _ready() :
	SignalBus.lose_life.connect(_lose_life)
	hpcount.text = str(hp)
	
	
func _lose_life():
	hp -= 1
	hpcount.text = str(hp)
	if hp == 0:
		game_over = true

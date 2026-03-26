extends Node

@export var hp = 3
@export var heartContainer: Node
var game_over = false

func _ready() :
	SignalBus.lose_life.connect(_lose_life)
	for heart in heartContainer.get_children():
		heart.show()
	
	
func _lose_life():
	hp -= 1
	heartContainer.get_child(hp).hide()
	if hp == 0:
		game_over = true
	await get_tree().create_timer(2.0).timeout

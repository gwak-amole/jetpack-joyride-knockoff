extends Node

@export var hp = 3
@export var heartContainer: Node
@export var pointsText: Label
@export var highScore: Label
var game_over = false
var points = 0

func _ready() :
	SignalBus.lose_life.connect(_lose_life)
	highScore.text = "High Score: " + str(SignalBus.high_score)
	pointsText.text = str(points)
	for heart in heartContainer.get_children():
		heart.show()
	
	
func _lose_life():
	hp -= 1
	heartContainer.get_child(hp).hide()
	if hp == 0:
		if (points > SignalBus.high_score):
			SignalBus.high_score = points
		get_tree().change_scene_to_file("res://scenes/gameover.tscn")
	else: 
		await get_tree().create_timer(2.0).timeout


func _on_timer_timeout() -> void:
	points += 30
	pointsText.text = str(points) 

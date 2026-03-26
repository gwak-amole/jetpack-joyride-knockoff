extends Node2D

@export var tree1: PackedScene
@export var tree2: PackedScene
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()

func _on_timer_timeout() -> void:
	var randNum = rng.randi_range(1, 2)
	var instance;
	if randNum == 1:
		instance = tree1.instantiate();
	else:
		instance = tree2.instantiate()
	add_child(instance)
	instance.global_position = self.global_position;
	$Timer.wait_time = (rng.randi_range(1, 4))

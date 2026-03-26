extends Node2D

@export var enemy: PackedScene
var spawn_y_array = [100.0, 200.0, 300.0, 400.0, 500.0]
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize();

func _on_timer_timeout() -> void:
	var y_pos_choose = rng.randi_range(0,4)
	var instance = enemy.instantiate()
	
	add_child(instance)
	instance.global_position = Vector2(1152, spawn_y_array[y_pos_choose])
	$Timer.start(rng.randi_range(1, 3))

extends CharacterBody2D

@export var speed = 500.0

func _physics_process(delta):
	position.x -= speed * delta


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player":
		SignalBus.lose_life.emit()
		await get_tree().create_timer(1.0).timeout
		queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

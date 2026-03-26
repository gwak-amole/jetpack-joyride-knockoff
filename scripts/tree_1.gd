extends StaticBody2D
@export var speed = 400.0

func _physics_process(delta):
	position.x -= speed * delta


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player":
		SignalBus.lose_life.emit()

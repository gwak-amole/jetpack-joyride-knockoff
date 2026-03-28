extends CharacterBody2D

@export var speed_y = 2500.0
@export var speed_x = 400.0
@export var gravity = 1500.0
@onready var screen_size = get_viewport_rect().size

func _ready():
	$AnimatedSprite2D.play("default")

func _physics_process(delta):
	var direction = Input.get_axis("ui_left", "ui_right")	
	velocity.x = speed_x * direction
	if Input.is_action_pressed("ui_accept"):
		velocity.y -= speed_y * delta
		$CPUParticles2D.emitting = true;
	if Input.is_action_just_released("ui_accept"):
		$jetpack_timer.start(0.1)

	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()
	
	if is_on_ceiling():
		velocity.y = abs(velocity.y) * 0.5
	if is_on_floor():
		velocity.y = 0
		
	position.x = clamp(position.x, 0+32, screen_size.x-32)


func _on_jetpack_timer_timeout() -> void:
	$CPUParticles2D.emitting = false

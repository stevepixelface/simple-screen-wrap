extends KinematicBody2D

onready var screen_size = get_viewport_rect().size

export (int) var speed = 120
export (float) var rotation_speed = 3

var velocity = Vector2.ZERO
var rotation_direction = 0

func _physics_process(delta):
	get_input()
	rotation += rotation_direction * rotation_speed * delta
	velocity = move_and_slide(velocity)
	wrap()
		
func get_input():
	rotation_direction = 0
	velocity = Vector2.ZERO
	if Input.is_action_pressed("rotate_right"):
		rotation_direction += 1
	if Input.is_action_pressed("rotate_left"):
		rotation_direction -= 1
	if Input.is_action_pressed("backward"):
		velocity -= transform.x * speed
	if Input.is_action_pressed("forward"):
		velocity += transform.x * speed
		
func wrap():
	position.x = wrapf(position.x, 0, screen_size.x)
	position.y = wrapf(position.y, 0, screen_size.y)
		

extends CharacterBody2D
class_name PlayerController

@export var move_speed = 40.0

var direction : Vector2

enum facing {UP, DOWN, LEFT, RIGHT}
var player_facing : facing

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("move_up"):
		direction.y = -1
		player_facing = facing.UP
	elif Input.is_action_pressed("move_down"):
		direction.y = 1
		player_facing = facing.DOWN
	else:
		direction.y = 0
	
	if Input.is_action_pressed("move_right"):
		direction.x = 1
		player_facing = facing.RIGHT
	elif Input.is_action_pressed("move_left"):
		direction.x = -1
		player_facing = facing.LEFT
	else:
		direction.x = 0
	
	velocity = direction * move_speed * delta * 200
	move_and_slide()

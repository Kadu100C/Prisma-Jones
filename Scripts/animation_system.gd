extends Node2D

@export var player_controller : PlayerController
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D



@onready var atk_up: Area2D = $"../atk_up"
@onready var atk_down: Area2D = $"../atk_down"
@onready var atk_right: Area2D = $"../atk_right"
@onready var atk_left: Area2D = $"../atk_left"


@onready var atk_up_2: CollisionShape2D = $"../atk_up/atk_up2"
@onready var atk_down_2: CollisionShape2D = $"../atk_down/atk_down2"
@onready var atk_right_2: CollisionShape2D = $"../atk_right/atk_right2"
@onready var atk_left_2: CollisionShape2D = $"../atk_left/atk_left2"


var chibatatda = 0

func _process(delta: float) -> void:
	
	if player_controller.velocity.length() > 0.0:
		if player_controller.player_facing == player_controller.facing.RIGHT:
			animated_sprite_2d.play("walk_right")
		if player_controller.player_facing == player_controller.facing.DOWN:
			animated_sprite_2d.play("walk_down")
		if player_controller.player_facing == player_controller.facing.UP:
			animated_sprite_2d.play("walk_up")
		if player_controller.player_facing == player_controller.facing.LEFT:
			animated_sprite_2d.play("idle_left")
	elif Input.is_action_pressed("chibatada") and player_controller.player_facing == player_controller.facing.DOWN:
		chibatatda = 1
		animated_sprite_2d.play("chicote_down")
		atk_down_2.disabled = false
		await get_tree().create_timer(1.0).timeout
		atk_down_2.disabled = true
		chibatatda = 0
	elif Input.is_action_pressed("chibatada") and player_controller.player_facing == player_controller.facing.UP:
		chibatatda = 1
		animated_sprite_2d.play("chicote_up")
		atk_up_2.disabled = false
		await get_tree().create_timer(1.0).timeout
		atk_up_2.disabled = true
		chibatatda = 0
	elif Input.is_action_pressed("chibatada") and player_controller.player_facing == player_controller.facing.RIGHT:
		chibatatda = 1
		animated_sprite_2d.play("chicote_right")
		atk_right_2.disabled = false
		await get_tree().create_timer(1.0).timeout
		atk_right_2.disabled = true
		chibatatda = 0
	elif Input.is_action_pressed("chibatada") and player_controller.player_facing == player_controller.facing.LEFT:
		chibatatda = 1
		animated_sprite_2d.play("chicote_left")
		atk_left_2.disabled = false
		await get_tree().create_timer(1.0).timeout
		atk_left_2.disabled = true
		chibatatda = 0
	else:
		if player_controller.player_facing == player_controller.facing.RIGHT and chibatatda == 0:
			animated_sprite_2d.play("idle_right")
		if player_controller.player_facing == player_controller.facing.DOWN and chibatatda == 0:
			animated_sprite_2d.play("idle_down")
		if player_controller.player_facing == player_controller.facing.UP and chibatatda == 0:
			animated_sprite_2d.play("idle_up")
		if player_controller.player_facing == player_controller.facing.LEFT and chibatatda == 0:
			animated_sprite_2d.play("idle_left")
	

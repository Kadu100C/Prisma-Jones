extends Node2D


@onready var prisma: PlayerController = $Prisma

@onready var botao_1: Area2D = $"botao 1"
@onready var pillar_man: AnimatedSprite2D = $"botao 1/pillar_man"

@onready var botao_2: Area2D = $botao_2
@onready var pillar_man_2: AnimatedSprite2D = $botao_2/pillar_man_2

@onready var botao_3: Area2D = $botao_3
@onready var pillar_man_3: AnimatedSprite2D = $botao_3/pillar_man_3

@onready var bloqueio: StaticBody2D = $bloqueio
@onready var collision_shape_2d: CollisionShape2D = $StaticBody2D/CollisionShape2D

@onready var prox_area: Area2D = $prox_area

@onready var porta_34: AnimatedSprite2D = $porta_34

var puzzle = 0
var win = false

func _process(delta: float) -> void:
	if puzzle == 3 and not win:
		porta_34.play("porta_aberta")
		bloqueio.queue_free()
		win = true
	print(puzzle)


func _on_botao_1_area_entered(area: Area2D) -> void:
	if area.is_in_group("chicotada") and puzzle == 1:
		pillar_man.play("botao_apertado")
		puzzle = 2
	else:
		pillar_man.play("botao_fds")
		pillar_man_2.play("botao_fds")
		pillar_man_3.play("botao_fds")
		puzzle = 0




func _on_botao_2_area_entered(area: Area2D) -> void:
	if area.is_in_group("chicotada"):
		pillar_man_2.play("botao_apertado")
		puzzle = 1


func _on_botao_3_area_entered(area: Area2D) -> void:
	if area.is_in_group("chicotada") and puzzle == 2:
		pillar_man_3.play("botao_apertado")
		puzzle = 3
	else:
		pillar_man.play("botao_fds")
		pillar_man_2.play("botao_fds")
		pillar_man_3.play("botao_fds")
		puzzle = 0


func _on_prox_area_body_entered(body: CharacterBody2D) -> void:
	get_tree().change_scene_to_file("res://Scenes/fase_6.tscn")

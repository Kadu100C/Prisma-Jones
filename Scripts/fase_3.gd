extends Node2D


@onready var botao: Area2D = $botao
@onready var prisma: PlayerController = $Prisma
@onready var prox_area: Area2D = $prox_area
@onready var porta_34: AnimatedSprite2D = $porta_34
@onready var bloqueio: StaticBody2D = $bloqueio
@onready var pillar_man: AnimatedSprite2D = $botao/pillar_man

var puzzle = 0





func _on_botao_area_entered(area: Area2D) -> void:
	if area.is_in_group("chicotada"):
		botao.queue_free()
		pillar_man.play("botao_apertado")
		puzzle += 1
		porta_34.play("porta_aberta")
		bloqueio.queue_free()


func _on_prox_area_body_entered(body: CharacterBody2D) -> void:
	get_tree().change_scene_to_file("res://Scenes/fase_4.tscn")

extends Node2D

@onready var porta_a: AnimatedSprite2D = $porta_a

@onready var prisma: PlayerController = $Prisma

@onready var botao_1: Area2D = $botao_1
@onready var botao_2: Area2D = $botao_2
@onready var botao_3: Area2D = $botao_3

@onready var bloqueio: StaticBody2D = $bloqueio
@onready var prox_area: Area2D = $prox_area
@onready var collision_shape_2d: CollisionShape2D = $bloqueio/CollisionShape2D

@onready var botao_chao: AnimatedSprite2D = $botao_1/botao_chao
@onready var pillar_man: AnimatedSprite2D = $botao_2/pillar_man
@onready var pillar_man_2: AnimatedSprite2D = $botao_3/pillar_man2




func _on_botao_1_body_entered(body: CharacterBody2D) -> void:
	botao_chao.play("botao_pobre")
	botao_2.show()


func _on_botao_1_body_exited(body: CharacterBody2D) -> void:
	botao_chao.play("botao_triste")
	botao_2.hide()





func _on_botao_2_area_entered(area: Area2D) -> void:
	if area.is_in_group("chicotada"):
		pillar_man.play("botao_apertado")
		$bloqueio.set_collision_layer(0)
		porta_a.play("porta_aberta_a")




func _on_botao_3_area_entered(area: Area2D) -> void:
	if area.is_in_group("chicotada"):
		pillar_man.play("botao_apertado")
		$bloqueio.set_collision_layer(1)
		porta_a.play("porta_fechada_a")


func _on_prox_area_body_entered(body: CharacterBody2D) -> void:
	pass # Replace with function body.

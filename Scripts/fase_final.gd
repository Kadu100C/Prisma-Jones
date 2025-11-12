extends Node2D

@onready var prisma: PlayerController = $Prisma
@onready var camera_2d: Camera2D = $Prisma/Camera2D
@onready var otario: Area2D = $otario


func _on_otario_body_entered(body: CharacterBody2D) -> void:
	
	var tween = create_tween()
	tween.tween_property(camera_2d, "zoom", Vector2(0.25, 0.25), 0.5)
	await get_tree().create_timer(3.0).timeout  # zoom out em 0.5 segundos
	get_tree().change_scene_to_file("res://Scenes/tela_final.tscn")

extends Node2D
@onready var prisma: PlayerController = $Prisma
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D
@onready var vorta: Area2D = $vorta






func _on_vorta_body_entered(body: CharacterBody2D) -> void:
	get_tree().change_scene_to_file("res://Scenes/fase_6.tscn")

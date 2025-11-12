extends Node2D
@onready var prisma: PlayerController = $Prisma
@onready var prox_area: Area2D = $prox_area
@onready var now_is_your_chance_to_be_a: Area2D = $now_is_your_chance_to_be_a




func _on_prox_area_body_entered(body: CharacterBody2D) -> void:
	get_tree().change_scene_to_file("res://Scenes/run_prisma.tscn")



func _on_now_is_your_chance_to_be_a_body_entered(body: CharacterBody2D) -> void:
	get_tree().change_scene_to_file("res://Scenes/bigshot.tscn")

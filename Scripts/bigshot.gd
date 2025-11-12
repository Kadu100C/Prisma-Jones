extends Node2D
@onready var prisma: PlayerController = $Prisma
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D





func _on_area_2d_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Scenes/fase_6.tscn")

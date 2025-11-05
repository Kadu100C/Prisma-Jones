extends Node2D
@onready var grade: AnimatedSprite2D = $grade


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.puzzlereload += 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.puzzlereload >= 2:
		grade.play("parabens")
		Global.puzzlereload -= 1


func _on_prox_area_body_entered(body: CharacterBody2D) -> void:
	get_tree().change_scene_to_file("res://Scenes/fase_3.tscn")

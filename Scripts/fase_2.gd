extends Node2D

@onready var porta_34: AnimatedSprite2D = $porta_34
@onready var bloqueio: StaticBody2D = $bloqueio


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.puzzlereload += 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.puzzlereload >= 2:
		porta_34.play("porta_aberta")
		bloqueio.queue_free()
		Global.puzzlereload -= 1


func _on_prox_area_body_entered(body: CharacterBody2D) -> void:
	get_tree().change_scene_to_file("res://Scenes/fase_3.tscn")

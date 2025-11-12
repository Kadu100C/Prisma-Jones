extends Control


#botoes
@onready var iniciar_button: Button = $VBoxContainer/iniciar_button
@onready var creditos_button: Button = $VBoxContainer/creditos_button
@onready var sair_button: Button = $VBoxContainer/sair_button



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_sair_button_pressed() -> void:
	get_tree().quit()


func _on_iniciar_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/fase_1.tscn")


func _on_creditos_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/creditos.tscn")

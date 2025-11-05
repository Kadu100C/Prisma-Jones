extends CanvasLayer

#botoes
@onready var retornar_button: Button = $VBoxContainer/retornar_button
@onready var recarregar_button: Button = $VBoxContainer/recarregar_button
@onready var menu_button: Button = $VBoxContainer/menu_button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		visible = true
		get_tree().paused = true


func _on_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/tela_inicial.tscn")


func _on_retornar_button_pressed() -> void:
	get_tree().paused = false
	visible = false


func _on_recarregar_button_pressed() -> void:
	get_tree().paused = false
	visible = false
	get_tree().reload_current_scene()


func _on_menu_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/tela_inicial.tscn")

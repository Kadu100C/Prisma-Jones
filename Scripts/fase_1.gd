extends Control


var puzle = 0

@onready var botao: Area2D = $"../botao"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_botao_area_entered(area: Area2D) -> void:
	if area.is_in_group("chicotada"):
		$"../botao".queue_free()
		puzle += 1
		print(puzle)

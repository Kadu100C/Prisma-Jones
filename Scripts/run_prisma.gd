extends Node2D
@onready var prisma_runner: AnimatedSprite2D = $prisma_runner


var speed = 200

var cima = 1
var baixo = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	prisma_runner.position.x += speed * delta
	#meio para cima
	if Input.is_action_pressed("move_up") and cima == 1 and baixo == 1:
		var tween = create_tween()
		tween.tween_property(prisma_runner, "position:y", 130, 0.2) \
		.set_trans(Tween.TRANS_LINEAR) \
		.set_ease(Tween.EASE_IN_OUT)
	else:
		pass
		#meio para baixo
	if Input.is_action_pressed("move_down") and baixo == 1 and cima == 1:
		var tween = create_tween()
		tween.tween_property(prisma_runner, "position:y", 200, 0.2) \
		.set_trans(Tween.TRANS_LINEAR) \
		.set_ease(Tween.EASE_IN_OUT)
	else:
		pass
		#baixo para o meio
	if Input.is_action_pressed("move_up") and baixo == 0 and cima == 1:
		var tween = create_tween()
		tween.tween_property(prisma_runner, "position:y", 140, 0.2) \
		.set_trans(Tween.TRANS_LINEAR) \
		.set_ease(Tween.EASE_IN_OUT)
	print(cima)
	print(baixo)

func _on_meio_body_entered(_body: AnimatedSprite2D) -> void:
	cima = 1
	baixo = 1


func _on_cima_body_entered(_body: AnimatedSprite2D) -> void:
	cima = 0
	baixo = 1


func _on_baixo_body_entered(_body: AnimatedSprite2D) -> void:
	cima = 1
	baixo = 0

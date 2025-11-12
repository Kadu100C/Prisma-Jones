extends Node2D

@onready var prisma: PlayerController = $Prisma
@onready var prisma_runner: AnimatedSprite2D = $prisma_runner

@onready var time_to_run: Area2D = $ready

@onready var re_4: AnimatedSprite2D = $re4

@onready var vida: ProgressBar = $prisma_runner/vida

@onready var camera_22: Camera2D = $prisma_runner/Camera22

@onready var prox_area_2: Area2D = $prox_area2

var prisma_hp = 100

var gotta_go_fast = false
var speed = 200
var pedra_speed = 1.5
var movimento = 2

func _ready() -> void:
	vida.value = prisma_hp


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if gotta_go_fast == true:
		prisma_runner.position.x += speed * delta
		re_4. position.x += speed * delta * pedra_speed
		await get_tree().create_timer(1.0).timeout
		pedra_speed  = 1
	if prisma_hp <= 0:
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
	
	#meio para cima
	if Input.is_action_just_pressed("move_up") and movimento == 2 and gotta_go_fast == true:
		movimento += 1
		var tween = create_tween()
		tween.tween_property(prisma_runner, "position:y", 740.0, 0.2)
	#meio para baixo
	elif Input.is_action_just_pressed("move_down") and movimento == 2 and gotta_go_fast == true:
		movimento -= 1
		var tween = create_tween()
		tween.tween_property(prisma_runner, "position:y", 804.0, 0.2)
	
	#cima para meio
	if Input.is_action_just_pressed("move_down") and movimento == 3 and gotta_go_fast == true:
		movimento -= 1
		var tween = create_tween()
		tween.tween_property(prisma_runner, "position:y", 772.0, 0.2)
		
	#baixo para o meio
	if Input.is_action_just_pressed("move_up") and movimento == 1 and gotta_go_fast == true:
		movimento += 1
		var tween = create_tween()
		tween.tween_property(prisma_runner, "position:y", 772.0, 0.2)


func _on_ready_body_entered(body: CharacterBody2D) -> void:
	gotta_go_fast = true
	prisma.queue_free()
	prisma_runner.show()
	re_4.show()
	camera_22.show()


func _on_espinho_area_entered(area: Area2D) -> void:
	if area.is_in_group("hurtbox"):
		prisma_hp -= 40
		vida.value = prisma_hp


func _on_prox_area_2_area_entered(area: Area2D) -> void:
	if area.is_in_group("hurtbox"):
		get_tree().change_scene_to_file("res://Scenes/fase_final.tscn")

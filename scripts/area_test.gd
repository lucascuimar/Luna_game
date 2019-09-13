extends Node2D

var pre_lua = preload("res://scenes/lua.tscn") #variavel de carregar lua
var pre_bola_especial = preload("res://scenes/lua_especial.tscn")

var contador = 0
var bola_especial = 0
var ativa_especial = false

# Called when the node enters the scene tree for the first time.
func _ready():
	inicio_bolinha()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	randomize()
	pass

func gera_lua():
	for x in 20:
		var bola = pre_lua.instance()
		var dir_x = rand_range(125 , 380)
		bola.global_position = Vector2(dir_x, -185)
		call_deferred("add_child", bola)
		pass

func inicio_bolinha():
	for inicio_bola in 20:
		var bola = pre_lua.instance()
		var dir_x = rand_range(125 , 380)
		bola.global_position = Vector2(dir_x, -185)
		call_deferred("add_child", bola)
		pass
#	pass

func bolaespecial():
	var bolaespecial = pre_bola_especial.instance()
	var dir_dir = rand_range(125 , 380)
	bolaespecial.global_position = Vector2(dir_dir, -185)
	call_deferred("add_child", bolaespecial)

func _on_contador_body_entered(body):
	contador += 1
	pass # Replace with function body.

func _on_contador_body_exited(body):
	contador -= 1
	if contador == 15:
		gera_lua()
	bola_especial += 1
	if bola_especial >= 20:
		bolaespecial()
		bola_especial = 0
		pass
	
	if body.has_method("especial"):
		$Timer.start()
		#ativa_especial = true
		$muros/CollisionPolygon2D.disabled = true
		$playback.stream_paused = true
		$som_especial.playing = true
		
		
		
	pass # Replace with function body.

func _draw():
	var cor_muro = Color(0.82, 0.41, 0.12, 1)
	#configuração do muro lados
	draw_line(Vector2(50, 0) ,Vector2(50, 555), cor_muro, 20)
	draw_line(Vector2(440, 0) ,Vector2(440, 555), cor_muro, 20)
	#base
	draw_line(Vector2(50, 540), Vector2(255,630), cor_muro, 32)
	draw_line(Vector2(440, 540), Vector2(245,630), cor_muro, 32)
	
	
	pass


func _on_Area2D_body_entered(body):#area de segurança
	body.morre()
	if contador == 15:
		gera_lua()
	pass # Replace with function body.


#func _on_area_especial_body_entered(body):#area de especial
#	if ativa_especial:
#		body.morre()
#	if contador == 15:
#		gera_lua()
#	pass # Replace with function body.


func _on_Timer_timeout():
	$muros/CollisionPolygon2D.disabled = false
	$som_especial.playing = false
	$playback.stream_paused = false
	pass # Replace with function body.

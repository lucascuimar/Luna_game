extends RigidBody2D

var cor_azul = Color(0,0,1)
var cor_verde = Color(0,1,0)
var cor_vermelha = Color(1,0,0)
var morreu = false

func _ready():
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	randomize()
	if morreu:
		update()
	pass

#func _input(event):
#	if event is InputEventMouseButton:
#		print("Mouse Click/Unclick at: ", event.position)
#	elif event is InputEventMouseMotion:
#		print("Mouse Motion at: ", event.position)

   # Print the size of the viewport
#	print("Viewport Resolution is: ", get_viewport_rect().size)
#	pass

func morre():
	$AudioStreamPlayer2D.playing = true
	$Timer.start()
	morreu = true

func _on_area_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		morre()
	pass # Replace with function body.

func _draw():
	var cor_ = rand_range(0 , 3)
	cor_ = ceil(cor_)
	if cor_ == 1:
		draw_circle(Vector2(), 36.5, cor_azul)
	elif cor_ == 2:
		draw_circle(Vector2(), 36.5, cor_verde)
	elif cor_ == 3:
		draw_circle(Vector2(), 36.5, cor_vermelha)
	pass
	


func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.

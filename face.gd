extends Node2D

var size = 50
var eye_count = 2
var is_happy = true
var face_color = Color.WHITE

func _ready():
	queue_redraw()

func _draw():
	draw_circle(Vector2.ZERO, size, face_color)

	for i in range(eye_count):
		var x = -size/2 + i * (size / (eye_count - 1))
		draw_circle(Vector2(x, -size/3), size/8, Color.BLACK)

	if is_happy:
		draw_arc(Vector2(0, size/4), size/2, 0, PI, 20, Color.BLACK, 2)
	else:
		draw_arc(Vector2(0, size/2), size/2, PI, 2*PI, 20, Color.BLACK, 2)

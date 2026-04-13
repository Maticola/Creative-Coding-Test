extends Node2D

@onready var face_scene = preload("res://Face.tscn")
@onready var container = $FaceContainer
@onready var happy_label = $HappyLabel
@onready var sad_label = $SadLabel

var happy_count = 0
var sad_count = 0

func _on_button_pressed():
	var num_faces = randi_range(1, 10)

	for i in range(num_faces):
		var face = face_scene.instantiate()

		face.size = randi_range(20, 150)
		face.eye_count = randi_range(2, 6)
		face.face_color = Color(randf(), randf(), randf())
		face.is_happy = randf() < 0.5

		face.position = Vector2(
			randi_range(100, 800),
			randi_range(100, 600)
		)

		container.add_child(face)

		if face.is_happy:
			happy_count += 1
		else:
			sad_count += 1

	update_labels()

func update_labels():
	happy_label.text = "Happy: " + str(happy_count)
	sad_label.text = "Sad: " + str(sad_count)

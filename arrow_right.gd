extends Area2D

signal touched

var speed = 300
var direction = Vector2()

func _process(delta):
	direction.x = 1
	position += direction * speed * delta

func _on_body_entered(body):
	if body.name == "Player":
		touched.emit()

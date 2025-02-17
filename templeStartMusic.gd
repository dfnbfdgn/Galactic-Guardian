extends Area2D

signal start

func _on_body_entered(body):
	if body.name == "Player":
		emit_signal("start")

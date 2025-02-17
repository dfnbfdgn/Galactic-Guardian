extends Area2D

signal touched


func _on_body_entered(body):
	if body.name == "Player":
		touched.emit()
		

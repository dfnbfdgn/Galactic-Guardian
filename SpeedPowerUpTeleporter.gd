extends Area2D

func _on_body_entered(body):
	if body.name == 'Player':
		body.position.x = 4940
		body.position.y = 430

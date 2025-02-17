extends Area2D

signal stopEelSpawns

func _on_body_entered(body):
	if body.name == 'Player':
		print('emitted')
		stopEelSpawns.emit()

extends Area2D

signal trap


func _on_body_entered(body):
	if body.name == "Player":
		emit_signal("trap")


func _on_plate_9_trap():
	pass # Replace with function body.

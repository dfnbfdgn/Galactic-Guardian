extends Area2D

signal potion1

func _process(delta):
	$AnimatedSprite2D.play("default")



func _on_body_entered(body):
	if body.name == "Player":
		$pickUp.play()
		emit_signal("potion1")
		queue_free()

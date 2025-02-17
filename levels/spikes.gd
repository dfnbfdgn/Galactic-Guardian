extends Area2D

signal touched

func _ready():
	$AnimationPlayer.play("initialPosition")


func _on_strike_tmer_timeout():
	$AnimationPlayer.play("spikeDrop")


func _on_body_entered(body):
	if body.name == 'Player':
		touched.emit()

extends Node

func _ready():
	$AnimatedSprite2D.play("planetSpin")
	$sceneFade/AnimationPlayer.play("fadeIn")



func _on_scene_change_timer_timeout():
	$sceneFade/AnimationPlayer.play("fadeOut")

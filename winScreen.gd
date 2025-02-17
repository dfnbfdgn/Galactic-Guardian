extends Node

func _ready():
	$Lava.play("planetSpin")
	$water.play("planetSpin")
	$forest.play("planetSpin")
	$desert.play("planetSpin")
	$city.play("planetSpin")
	$sceneFade/AnimationPlayer.play("fadeIn")


func _on_scene_change_timer_timeout():
	$sceneFade/AnimationPlayer.play("fadeOut")

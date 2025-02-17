extends Node2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_oob_body_entered(body):
	if body.is_in_group('Player'):
		get_tree().reload_current_scene()


func _on_end_body_entered(body):
	if body.is_in_group('Player'):
		get_tree().change_scene_to_file("res://water_planet.tscn")


func _on_desert_music_finished():
	$DesertMusic.play()

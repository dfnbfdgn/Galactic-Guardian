extends Control

var playerLives = 3

func _on_damage_taken():
	if playerLives == 1:
		get_tree().reload_current_scene() #game over, reload scene
	playerLives -= 1

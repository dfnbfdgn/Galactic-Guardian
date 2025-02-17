extends Control

var playerLives = 4

func apply_damage():
	if playerLives == 1:
		get_tree().reload_current_scene() #game over, reload scene
	playerLives -= 1

func _on_player_apply_damage():
	apply_damage()

func _on_x_jump_potion_1():
	if playerLives < 4:
		playerLives += 1

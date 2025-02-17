extends Node2D

var counter = 0



func _on_area_2d_body_entered(body):
	if body.name == "Player":
		counter += 1
		if counter < 2:
			$mystery.play()




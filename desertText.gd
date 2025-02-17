extends Label

var bubble = "Sandworms native to Desertia have become overpopulated and have taken control of the planet. 
This is the job for the Galactic Gaurdian of the ICACIA. He must defend their supply of ancient green emeralds.

What new secrets will he discover? Only the sands of time will tell."
var textPosition = 0

func _ready():
	pass


func _on_text_timer_timeout():
	textPosition +=1
	text = bubble.substr(0,textPosition)
	if textPosition == bubble.length():
		$textTimer.stop()
		$sceneChangeTimer.start()
	



func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fadeIn":
		print("im at the end of fadeIn")
		$textTimer.start()
	
	if anim_name == "fadeOut":
		$sceneChangeTimer.stop()
		get_tree().change_scene_to_file("res://desert_2.tscn")

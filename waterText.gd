extends Label

var bubble = "An invasive species of eels have risen the water levels of Seaia 
making the explotation of natural resources by the ICACIA impossible.
You, The Galactive Guardian, have been tasked with eliminating these creatures.
 
Will the tides turn in his favor?"
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
		get_tree().change_scene_to_file("res://water_1.tscn")

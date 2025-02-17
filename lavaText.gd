extends Label

var bubble = "A new energy source has recently been discovered on Lavaia by the ICACIA
The local dragon population is not eager to share this valueable resource for free.
So you, The Galactic Guardian, have been sent to \"convince\" the dragons to reconsider.

Will he be able to persuade them?"
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
		get_tree().change_scene_to_file("res://main.tscn")

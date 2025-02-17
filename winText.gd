extends Label

var bubble = "The Intergalactic Cosmological Astronomical Confederation of Interplanitary Associations
in its infinite wisdom has once again saved the galaxy from an otherwise mundane day.

The indiviual we have to thank is the one and only...

...The Galactic Guardian.

"
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
		get_tree().change_scene_to_file("res://title_screen.tscn")

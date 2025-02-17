extends Label

var bubble = "Oh No! Giant slugs have infested the planet Forestia. The Intergalactic Cosmological Astronomical 
Confederation of Interplanitary Associations or ICACIA has sent their most diligent agent...

...The Galactic Guardian.

What adventures will he get up to?"
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
		get_tree().change_scene_to_file("res://level1.tscn")

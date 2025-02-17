extends Label

var bubble = "Citizens of the planet Cityia have been reluctant to comply with the ICACIA's 
new laws on intergalactic trout. They have sent their most decorated agent know only as...

...The Galactic Guardian.

To reinforce the law, he will stop at nothing."
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
		get_tree().change_scene_to_file("res://levels/city_world_1.tscn")

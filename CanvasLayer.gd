extends CanvasLayer

var hits = 0

func _ready():
	$fullHealth.visible = true
	$health3.visible = false
	$health2.visible = false
	$health1.visible = false
	$empty.visible = false
	$PU.visible = false

func _on_player_health_lost():
	hits += 1
	$hit.play()
	if hits == 1:
		$health3.visible = true
		$fullHealth.visible = false
	
	if hits == 2:
		$health3.visible = false
		$health2.visible = true
	
	if hits == 3:
		$health2.visible = false
		$health1.visible = true
	
	if hits == 4:
		$health1.visible = false
		$empty.visible = true
		$fullHealth.visible = true
		$empty.visible = false
		
		





func _on_player_picked_up():
	$PU.visible = true


func _on_area_2d_2_body_entered(body):
	if body.name == "Player":
		get_tree().reload_current_scene()










func _on_x_jump_2_potion_1():
	_on_player_picked_up()


func _on_x_jump_2_potion_2():
	if hits > 0:
		hits -= 1
		
	if hits == 0:
		$fullHealth.visible = true
		$health3.visible = false
		$health2.visible = false
		$health1.visible = false
		$empty.visible = false
	
	if hits == 1:
		$health3.visible = true
		$fullHealth.visible = false
		$health2.visible = false
		$health1.visible = false
		$empty.visible = false
	
	if hits == 2:
		$fullHealth.visible = false
		$health3.visible = false
		$health1.visible = false
		$empty.visible = false
		$health2.visible = true
	
	if hits == 3:
		$fullHealth.visible = false
		$health3.visible = false
		$health2.visible = false
		$empty.visible = false
		$health1.visible = true
	

	

extends Area2D

var canShoot = false
var lock = false



func _process(delta):
	if $AnimatedSprite2D.frame == 11 && canShoot == true:
		shoot()
		canShoot = false
		$arrowSound.play()
	
	elif $AnimatedSprite2D.frame == 15 && canShoot == true:
		shoot()
		canShoot = false
		$arrowSound.play()
	
	elif $AnimatedSprite2D.frame == 19 && canShoot == true:
		shoot()
		canShoot = false
		$arrowSound.play()
	
	elif $AnimatedSprite2D.frame != 11 && $AnimatedSprite2D.frame != 15 && $AnimatedSprite2D.frame != 19:
		canShoot = true
		
		
	if $AnimatedSprite2D.frame == 26:
		$AnimatedSprite2D.stop()

func shoot():
	$arrowSound.play()
	const arrow = preload("res://arrow.tscn")
	var new_bullet = arrow.instantiate()
	new_bullet.position = $mark.position
	$mark.add_child(new_bullet)


func _on_plate_trap():
	$AnimatedSprite2D.play("trigger")
	



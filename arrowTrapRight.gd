extends Area2D

var canShoot = false
var lock = false
func _ready():
	$AnimatedSprite2D.flip_h = true
	


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
	const arrow = preload("res://arrow_right.tscn")
	var new_bullet = arrow.instantiate()
	if get_tree().current_scene.name == 'Node2D':
		new_bullet.touched.connect($/root/Node2D/Player._on_damaging_object_touched)
	if get_tree().current_scene.name == 'Level2':
		new_bullet.touched.connect($/root/Level2/Player/Player._on_damaging_object_touched)
	new_bullet.position = $mark.position
	$mark.add_child(new_bullet)


func _on_plate_trap():
	$AnimatedSprite2D.play("trigger")
	


func attack():
	$AnimatedSprite2D.play("trigger")


func _on_plate_2_trap():
	$AnimatedSprite2D.play("trigger")

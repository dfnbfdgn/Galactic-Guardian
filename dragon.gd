extends CharacterBody2D

@export var fireBallScene : PackedScene
var player = null
var speed =50
var dir = Vector2()
var left_corner = (position.x - 50)
var right_corner = (position.x + 50)
@onready var fireBallDirectionRay = $FireBallDirectionRay
@onready var fireBallSpawnPoint = $FireBallDirectionRay/FireballMarker
var health = 3
# Called when the node enters the scene tree for the first time.
func _ready():
	dir.x = 1
	$AnimationPlayer.play("Idle")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $AnimationPlayer.current_animation != "Attack":
		position += dir*speed*delta
	
	#if position.x > $MarkerRight.position.x:
		#scale.x = -2
		#dir.x = -1
		#print("Going Left")
	#if position.x < $MarkerLeft.position.x:
		#scale.x = 2
		#dir.x = 1
		#print ("Going Right")

		
func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		player = body
		if body.position < position:
			scale.x = -2
		if body.position > position:
			scale.x = 2
		$FireBallDirectionRay/ShootTimer.start()
		

func shoot():
	$AnimationPlayer.play("Attack")
	var fireBall = fireBallScene.instantiate()
	if get_tree().current_scene.name == 'main':
		fireBall.touched.connect($/root/main/Player._on_damaging_object_touched)
	if get_tree().current_scene.name == 'main2':
		fireBall.touched.connect($/root/main2/Player._on_damaging_object_touched)
	get_tree().current_scene.add_child(fireBall)
	fireBall.global_position = fireBallSpawnPoint.global_position
	fireBall.global_rotation = fireBallDirectionRay.global_rotation


func _on_shoot_timer_timeout():
	shoot()

var counter = 0

func turn():
	if counter % 2 == 0:
		scale.x = -2
		dir.x *= -1
	
	if counter % 2 == 1:
		scale.x = 2
		dir.x *= -1
	
	counter = counter +1


func _on_area_2d_area_entered(area):
	if area.is_in_group("damage"):
		health -= 1
		area.queue_free()
		if health <= 0:
			queue_free()

extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -300

@export var PlayerBulletTemplate : PackedScene
@onready var bulletDirectionRay = $BulletDirectionRay
@onready var bulletSpawnPoint = $BulletDirectionRay/BulletSpawnPoint

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var lastDirection = "Right" #spawn faced to the right

func _physics_process(delta):
	if not is_on_floor(): #gravity
		velocity.y += gravity * delta
		
	var direction = Input.get_axis("moveLeft", "moveRight")	
	if direction:
		updateBulletRay(direction)
		velocity.x = direction * SPEED
		if velocity.x > 0 and is_on_floor():
			$AnimatedSprite2D.animation = "walk"
			$AnimatedSprite2D.flip_h = false
			lastDirection = "Right"
			if Input.is_action_just_pressed("shoot"):
				shootBullet()
		elif velocity.x <0 and is_on_floor():
			$AnimatedSprite2D.animation = "walk"
			$AnimatedSprite2D.flip_h = true
			lastDirection = "Left"
			if Input.is_action_just_pressed("shoot"):
				shootBullet()
		elif velocity.x > 0 and !is_on_floor():
			$AnimatedSprite2D.animation = "jump_impact"
			$AnimatedSprite2D.flip_h = false
			lastDirection = "Right"
		elif velocity.x <0 and !is_on_floor():
			$AnimatedSprite2D.animation = "jump_impact"
			$AnimatedSprite2D.flip_h = true
			lastDirection = "Left"
	else:
		if Input.is_action_just_pressed("shoot") and is_on_floor():
			shootBullet()
		if Input.is_action_pressed("shoot") and is_on_floor():
			$AnimatedSprite2D.animation = "shoot"
		elif lastDirection == "Right" and is_on_floor():
			$AnimatedSprite2D.animation = "idle"
			$AnimatedSprite2D.flip_h = false
		elif lastDirection == "Left" and is_on_floor():
			$AnimatedSprite2D.animation = "idle"
			$AnimatedSprite2D.flip_h = true
		elif lastDirection == "Right" and !is_on_floor():
			$AnimatedSprite2D.animation = "jump_impact"
			$AnimatedSprite2D.flip_h = false
		elif lastDirection == "Left" and !is_on_floor():
			$AnimatedSprite2D.animation = "jump_impact"
			$AnimatedSprite2D.flip_h = true
		velocity.x = move_toward(velocity.x, 0, SPEED)
	$AnimatedSprite2D.play()

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	move_and_slide()

func updateBulletRay(direction):
	if direction == 1:
		bulletDirectionRay.rotation = 0
	elif direction == -1:
		bulletDirectionRay.rotation = 180 * PI/180

func shootBullet():
	var bullet = PlayerBulletTemplate.instantiate()
	get_tree().current_scene.add_child(bullet)
	bullet.global_position = bulletSpawnPoint.global_position
	bullet.global_rotation = bulletDirectionRay.global_rotation

func _on_animated_sprite_2d_animation_looped():
	if $AnimatedSprite2D.animation == "shoot" or ($AnimatedSprite2D.animation == "walk" and Input.is_action_pressed("shoot")):
		shootBullet()

#func _on_kill_zone_body_entered(body):
	#get_tree().reload_current_scene()
#
#func _on_end_zone_body_entered(body):
	#print(get_tree().current_scene.name)
	#if get_tree().current_scene.name == "Level1":
		#get_tree().change_scene_to_file("res://level2.tscn")
	#elif get_tree().current_scene.name == "Level2":
		#get_tree().change_scene_to_file("res://level1.tscn")
	#

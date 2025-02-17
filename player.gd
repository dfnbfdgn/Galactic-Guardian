extends CharacterBody2D

signal applyDamage
var speed = 150.0
var JUMP_VELOCITY = -300
var onFloor = is_on_floor()
var activated = false
var counter = 0
@export var PlayerBulletTemplate : PackedScene
@onready var bulletDirectionRay = $BulletDirectionRay
@onready var bulletSpawnPoint = $BulletDirectionRay/BulletSpawnPoint
@onready var playerSprite = $AnimatedSprite2D
@onready var metalPowerupTimer = $MetalPowerupTimer

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var lastDirection = "Right" #spawn faced to the right
var holding = false
var damagedAnimationPlaying = false
var inFan = false
var playerIsMetal = false

func _ready():
	print(get_tree().current_scene.name)
	if get_tree().current_scene.name == 'cityWorld1':
		JUMP_VELOCITY = -425
	speed = 150.0
	playerSprite.get_material().set_shader_parameter("metal", false);

func _physics_process(delta):
	if(onFloor != is_on_floor() && onFloor == false): #Just Landed
		counter = 0
		if get_tree().current_scene.name == 'Node2D' or get_tree().current_scene.name == 'Level2':
			if holding == true:
				gravity *= 2
	
	onFloor = is_on_floor()
	
	if not is_on_floor(): #gravity
		velocity.y += gravity * delta
		if Input.is_action_just_released("jump"):
			if get_tree().current_scene.name == 'Node2D' or get_tree().current_scene.name == 'Level2':
				counter += 1
				holding = false
				if counter < 2:
					gravity *= 2
			
		
	var direction = Input.get_axis("moveLeft", "moveRight")	
	if damagedAnimationPlaying == true:
		playerSprite.animation = "damaged"
	elif direction:
		updateBulletRay(direction)
		velocity.x = direction * speed
		if velocity.x > 0 and is_on_floor():
			playerSprite.animation = "walk"
			playerSprite.flip_h = false
			lastDirection = "Right"
			if activated == false:
				if Input.is_action_just_pressed("shoot"):
					shootBullet()
		elif velocity.x <0 and is_on_floor():
			playerSprite.animation = "walk"
			playerSprite.flip_h = true
			lastDirection = "Left"
			if Input.is_action_just_pressed("shoot"):
				shootBullet()
		elif velocity.x > 0 and !is_on_floor():
			playerSprite.animation = "jump_impact"
			playerSprite.flip_h = false
			lastDirection = "Right"
		elif velocity.x <0 and !is_on_floor():
			playerSprite.animation = "jump_impact"
			playerSprite.flip_h = true
			lastDirection = "Left"
	else:
		if Input.is_action_just_pressed("shoot"):
			shootBullet()
		if Input.is_action_pressed("shoot"):
			playerSprite.animation = "shoot"
		elif lastDirection == "Right" and is_on_floor():
			playerSprite.animation = "idle"
			playerSprite.flip_h = false
		elif lastDirection == "Left" and is_on_floor():
			playerSprite.animation = "idle"
			playerSprite.flip_h = true
		elif lastDirection == "Right" and !is_on_floor():
			playerSprite.animation = "jump_impact"
			playerSprite.flip_h = false
		elif lastDirection == "Left" and !is_on_floor():
			playerSprite.animation = "jump_impact"
			playerSprite.flip_h = true
		velocity.x = move_toward(velocity.x, 0, speed)
	playerSprite.play()

	if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
			if get_tree().current_scene.name == 'Node2D' or get_tree().current_scene.name == 'Level2':
				gravity /= 2
				holding = true
	
	if inFan:
		velocity.y += JUMP_VELOCITY * 0.06 
	if playerIsMetal:
		velocity.y -= JUMP_VELOCITY* 0.06
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
	if playerSprite.animation == "shoot" or (playerSprite.animation == "walk" and Input.is_action_pressed("shoot")):
		shootBullet()
	if playerSprite.animation == "damaged":
		damagedAnimationPlaying = false
		applyDamage.emit()

func _on_damaging_object_touched():
	$AudioStreamPlayer2D.play()
	damagedAnimationPlaying = true

func _on_fan_entered():
	inFan = true

func _on_fan_exited():
	inFan = false

func _on_metal_powerup_touched():
	playerIsMetal = true
	playerSprite.get_material().set_shader_parameter("metal", true);
	metalPowerupTimer.start()

func _on_metal_powerup_timer_timeout():
	playerIsMetal = false
	playerSprite.get_material().set_shader_parameter("metal", false);

func _on_speed_power_up_body_entered(body):
	if body.name == "Player":
		speed += 150


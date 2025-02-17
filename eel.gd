extends Area2D

# Emitted when the player touches the eel.
signal touched

@export var backgroundSize = [1280, 4720]

var spriteLength = 94
var spriteHeight = 30
@export var speed = 150

var direction : String

func _physics_process(delta):
	var velocity = Vector2.ZERO # The ghost's movement vector.
	velocity.x -= 1
	velocity = velocity.normalized() * speed
	
	position += velocity * delta
	if position.x < 0 - spriteLength:
		queue_free()
	
	$AnimatedSprite2D.animation = "swim"
	$AnimatedSprite2D.play()

func _on_body_entered(body):
	if body.name == 'Player':
		touched.emit() #sends the signal that an enemy has been caught

func _on_area_entered(area):
	if area.is_in_group('damage'):
		queue_free()
		area.queue_free()

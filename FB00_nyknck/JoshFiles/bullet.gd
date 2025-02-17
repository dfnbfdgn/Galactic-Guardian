extends Area2D

#emits when bullet hits something
signal hit

@export var speedMultiple = 4.5
@export var backgroundSize = [1280, 720]

var bulletDirection = Vector2.RIGHT

func _ready():
	$AnimationPlayer.play("bulletFired")

func _process(delta):
	if position.y > backgroundSize[1] or position.y < 0:
		queue_free()
	elif position.x > backgroundSize[0] or position.x < 0:
		queue_free()

func _physics_process(delta):
	var bulletPosition = bulletDirection.rotated(rotation) * speedMultiple
	position += bulletPosition

func _on_body_entered(body):
	hit.emit() 
	queue_free() #delete this node later this frame

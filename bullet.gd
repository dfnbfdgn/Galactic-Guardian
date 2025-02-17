extends Area2D

#emits when bullet hits something
signal hit

@export var backgroundSize = [1280, 720]
@export var speedMultiple = 4.5

var bulletDirection = Vector2.RIGHT

func _ready():
	$AudioStreamPlayer2D.play()
	$AnimationPlayer.play("bulletFired")

func _physics_process(delta):
	var bulletPosition = bulletDirection.rotated(rotation) * speedMultiple
	position += bulletPosition

func _on_body_entered(body):
	hit.emit() 
	queue_free() #delete this node later this frame

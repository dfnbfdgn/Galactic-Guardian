extends Area2D

signal touched

var bulletDirection = Vector2.RIGHT
var bulletSpeed = 2

func _ready():
	$AnimationPlayer.play("bulletFired")

func _physics_process(delta):
	var bulletPosition = bulletDirection.rotated(rotation)*bulletSpeed
	position += bulletPosition

func _on_body_entered(body):
	if body.name == 'Player':
		touched.emit()
	queue_free()

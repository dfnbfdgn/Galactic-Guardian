extends Area2D

signal touched

@export var speed = 10
var floatingUp = true

func _physics_process(delta):
	var velocity = Vector2.ZERO # The ghost's movement vector.
	if floatingUp:
		velocity.y -= 1
	else:
		velocity.y += 1
	velocity = velocity.normalized() * speed
	position += velocity * delta

func _on_float_anim_timer_timeout():
	if floatingUp:
		floatingUp = false
	else:
		floatingUp = true

func _on_body_entered(body):
	if body.name == 'Player':
		touched.emit()
		queue_free()

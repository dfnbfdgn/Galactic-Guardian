extends RigidBody2D

signal touched

var speed = 50
var direction = Vector2()
var health = 4

func _ready():
	direction.x = 1
	
func _physics_process(delta):
	
	
	if direction.x > 0:
		$AnimatedSprite2D.play("moving")
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.play("moving")
		$AnimatedSprite2D.flip_h = false
	
	
	position += direction * delta * speed
	
	
	

func turn():
	direction.x *= -1

func loseHealth():
	health -= 1
	if health == 0:
		queue_free()

func _on_area_2d_body_entered(body):
	if body.is_in_group("block"):
		direction.x *= -1


func _on_area_2d_2_body_entered(body):
	if body.name == "Player":
		touched.emit()


func _on_area_2d_3_slug_hit():
	loseHealth()

extends Area2D

# Emitted when the player touches the fireball.
signal touched

var speed = 5
var direction = Vector2.RIGHT
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("Fireball")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	var fireBallPosition = direction.rotated(rotation) * speed
	position += fireBallPosition
	
func _on_body_entered(body):
	var dif = position.x - body.position.x
	if dif > 600:
		queue_free()
	if body.name == "Player":
		touched.emit()
		queue_free()
	

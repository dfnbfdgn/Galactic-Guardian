extends Area2D

# Emitted when the player is in the fan's area of effect
signal entered
signal exited

@onready var bubbleParticles = $CPUParticles2D
var playerInFan = false

func _physics_process(delta):
	$AnimatedSprite2D.animation = "default"
	if playerInFan:
		entered.emit() #sends the signal that player entered area of effect
	$AnimatedSprite2D.play()
	bubbleParticles.set_emitting(true)

func _on_body_entered(body):
	if body.name == 'Player':
		playerInFan = true

func _on_body_exited(body):
	if body.name == 'Player':
		playerInFan = false
		exited.emit() #sends the signal that player entered area of effect

extends CharacterBody2D

signal touched

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Swinging")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$AnimationPlayer.play("Swinging")

func _on_axe_area_body_entered(body):
	if body.name == 'Player':
		touched.emit()

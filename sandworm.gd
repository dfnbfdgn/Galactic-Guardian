extends Area2D

# Emitted when the player touches the sandworm.
signal touched

# Called when the node enters the scene tree for the first time.
func _ready():
	$SWAnimation.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if $SWAnimation.frame >= 4 && $SWAnimation.frame <= 10:
		$SWHitbox.disabled = false
	else:
		$SWHitbox.disabled = true


func _on_body_entered(body):
	if body.is_in_group('damage'):
		queue_free()
	if body.is_in_group('Player'):
		touched.emit()

var health = 2

func _on_area_entered(area):
	if area.is_in_group("damage"):
		health -= 1
		area.queue_free()
		if health <= 0:
			queue_free()

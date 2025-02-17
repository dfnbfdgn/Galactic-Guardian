extends Area2D

var player = null

# Called when the node enters the scene tree for the first time.
func _ready():
	modulate.a = 4


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if player:
		$ShieldAnimation.play("Shield")
		position = player.position
		#print(position)


func _on_area_entered(area):
	if area.is_in_group("Damage"):
		queue_free()


func _on_body_entered(body):
	if body.is_in_group("Player"):
		player = body
		#print(player)

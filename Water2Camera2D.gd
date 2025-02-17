extends Camera2D

var player : Node

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("/root/Water2/Player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if player:
		position.x = player.position.x
		position.y = player.position.y

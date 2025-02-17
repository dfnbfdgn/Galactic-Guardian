extends Area2D


@export var SandShieldScene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_body_entered(body):
	if body.is_in_group("Player"):
		var sand_shield = SandShieldScene.instantiate()
		get_tree().current_scene.add_child(sand_shield)
		sand_shield.global_position = body.global_position
		queue_free()

extends Area2D

# Emitted when the player touches the landmine.
signal touched

@export var ExplosionScene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_body_entered(body):
	if body.is_in_group('Player'):
		var explosion = ExplosionScene.instantiate()
		get_tree().current_scene.add_child(explosion)
		explosion.global_position = global_position
		touched.emit()
		queue_free()


func _on_area_entered(area):
	if area.is_in_group('Player'):
		var explosion = ExplosionScene.instantiate()
		get_tree().current_scene.add_child(explosion)
		explosion.global_position = global_position
		queue_free()

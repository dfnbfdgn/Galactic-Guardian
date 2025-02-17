extends Node2D

@export var EelTemplate : PackedScene

var backgroundSize = [1280, 720]
var cameraZoom = 2
@onready var cameraSize = get_viewport().size / cameraZoom

#Eel Sprite:
var spriteLength = 94
var spriteHeight = 30

var eelSpawning = true

func _on_eel_spawn_timer_timeout():
	if eelSpawning:
		var eel = EelTemplate.instantiate()
		randomSpawnPoint(eel)
		add_child(eel)
		eel.touched.connect($Player._on_damaging_object_touched)

func randomSpawnPoint(eel):
	var camera = $Water2Camera2D
	eel.position.x = (camera.position.x + cameraSize[0] + spriteLength)
	eel.position.y = (randf_range(camera.position.y + cameraSize[1]/2 - spriteHeight * 2, camera.position.y - cameraSize[1]/2 + spriteHeight * 2))

func _on_eel_toggle_1_stop_eel_spawns():
	eelSpawning = false

extends CharacterBody2D

@export var bulletScene : PackedScene
var player = null
@onready var bPath = $bulletPath
@onready var turretSprite = $turret
@onready var marker = $bulletPath/Marker2D

func _ready():	
	$AnimationPlayer.play("idleTurret")
	$bulletPath/reloadBullet.stop()

func _physics_process(delta):
	if player:
		var targetAngle = global_position.direction_to(player.global_position).angle()
		bPath.global_rotation = targetAngle
		turretSprite.rotation = targetAngle


func _on_aggro_body_entered(body):
	if body.is_in_group("player"):
		player = body
		$bulletPath/reloadBullet.start()
		$Aggro/ignoreTimer.stop()

func shootBullet():
	$AnimationPlayer.play("turretFired")
	var bullet = bulletScene.instantiate()
	bullet.touched.connect($/root/cityWorld1/Player._on_damaging_object_touched)
	get_tree().current_scene.add_child(bullet)
	bullet.global_position = marker.global_position
	bullet.global_rotation = bPath.global_rotation

func _on_reload_bullet_timeout():
	shootBullet()


func _on_aggro_body_exited(body):
	if body.is_in_group("player"):
		$Aggro/ignoreTimer.start()



func _on_ignore_timer_timeout():
	player = null
	$bulletPath/reloadBullet.stop()

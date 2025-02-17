extends Area2D

signal slugHit

func _on_area_entered(area):
	if area.name == "bullet":
		emit_signal("slugHit")

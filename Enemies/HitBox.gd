extends Area2D

var parent = owner as Enemy


func _on_HitBox_body_entered(body):
	assert(body.has_meta("damage"))
	parent.get_damaged(body.get_meta("damage"))
	pass # Replace with function body.


func _on_HitBox_area_entered(area):
	assert(area.has_meta("damage"))
	parent.get_damaged(area.get_meta("damage"))
	pass # Replace with function body.


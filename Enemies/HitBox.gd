extends Area2D


func _on_HitBox_body_entered(body):
	assert(body.has_meta("damage"))
	get_parent().get_damaged(body.get_meta("damage"))
	body.queue_free()
	pass # Replace with function body.


func _on_HitBox_area_entered(area):
	assert(area.has_meta("damage"))   
	get_parent().get_damaged(area.get_meta("damage"))
	pass # Replace with function body.


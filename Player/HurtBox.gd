extends Area2D




func _ready():
	set_meta("damage",2.0)


func swing():
	if visible:
		return
	visible = true
	get_parent().flipLock = true
	$CollisionShape2D.set_deferred("disabled",false)
	$SwingTimer.start()
	pass

func _on_SwingTimer_timeout():
	visible = false
	get_parent().flipLock = false
	$CollisionShape2D.set_deferred("disabled",true)
	pass # Replace with function body.

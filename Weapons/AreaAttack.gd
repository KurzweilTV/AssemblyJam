extends Area2D


func shoot(time : float):
	set_deferred("monitorable",true)
	set_deferred("monitoring",true)
	yield(get_tree().create_timer(time),"timeout")
	set_deferred("monitorable",false)
	set_deferred("monitoring",false)
	pass

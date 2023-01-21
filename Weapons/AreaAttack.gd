extends Area2D

export var attackTime = 0.5

func shoot():
	set_deferred("monitorable",true)
	set_deferred("monitoring",true)
	yield(get_tree().create_timer(attackTime),"timeout")
	set_deferred("monitorable",false)
	set_deferred("monitoring",false)
	pass

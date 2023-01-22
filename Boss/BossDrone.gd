extends PathFollow2D

signal boss_death

var phase = 1

export var health = 50


func get_damaged(dmg):
	if phase == 1:
		return
	health -= dmg
	$DamageFlash.play("New Anim")
	if health <0:
		die()
	pass
	
	
func die():
	emit_signal("boss_death")
	queue_free()

func start_boss():
	$AnimationPlayer.play("New Anim")
	_on_PhaseTimer_timeout()
	$PhaseTimer.start()

func _on_PhaseTimer_timeout():
	phase *= -1
	if phase == 1:
		for G in $Guns.get_children():
			G.fire()
			G.rotation_degrees = 270 + (randf()-0.5) * 50
			$Shield.visible = true
		pass
	else:
		for G in $Guns.get_children():
			G.shooting = false
			$Shield.visible = false
	pass # Replace with function body.

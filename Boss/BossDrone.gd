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
	for G in $Guns.get_children():
		G.shooting = false
	$PhaseTimer.stop()
	$AnimationPlayer.stop()
	$DeathAnimation.play("New Anim")
	$JunkGenerator.play()

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


func _on_DeathAnimation_animation_finished(anim_name):
	emit_signal("boss_death")
	$JunkGenerator.stop()
	queue_free()
	pass # Replace with function body.


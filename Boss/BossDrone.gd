extends PathFollow2D

var phase = 1

export var health = 50

func _ready():
	_on_PhaseTimer_timeout()
	$PhaseTimer.start()

func get_damaged(dmg):
	if phase == 1:
		return
	health -= dmg
	$DamageFlash.play("New Anim")
	if health <0:
		die()
	pass
	
	
func die():
	queue_free()



func _on_PhaseTimer_timeout():
	phase *= -1
	if phase == 1:
		for G in $Guns.get_children():
			G.fire()
			$AnimationPlayer.play("Up")
		pass
	else:
		for G in $Guns.get_children():
			G.shooting = false
			$AnimationPlayer.play("Down")
		pass
	pass # Replace with function body.

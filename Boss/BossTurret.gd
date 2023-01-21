extends Node2D


var phase = 1

export var health = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	_on_PhaseTimer_timeout()
	$PhaseTimer.start()
	pass # Replace with function body.

func _physics_process(delta):
	$Orb1/Center.look_at(GlobalPlayer.controller.global_position + Vector2(0,-100))


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
			$Shield.visible = true
		pass
	else:
		for G in $Guns.get_children():
			G.shooting = false
			$Shield.visible = false
		pass
	pass # Replace with function body.

extends Node2D

signal boss_death

var phase = -1

export var health = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(false)
	pass # Replace with function body.

func _physics_process(delta):
	$Orb1/Center.look_at(GlobalPlayer.controller.global_position + Vector2(0,-100))
	if phase == 1:
		if GlobalPlayer.controller.global_position.x > global_position.x:
			$Guns/HunterGun.fire()
			$Guns/HunterGun3.shooting = false
		else:
			$Guns/HunterGun3.fire()
			$Guns/HunterGun.shooting = false


func start_boss():
	$PhaseTimer.start()
	set_physics_process(true)
	pass

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


func _on_PhaseTimer_timeout():
	phase *= -1
	if phase == 1:
		$Shield.visible = true
		pass
	else:
		for G in $Guns.get_children():
			G.shooting = false
		$Shield.visible = false
		pass
	pass # Replace with function body.

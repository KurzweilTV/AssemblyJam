extends Node2D

signal boss_death

var phase = -1

export var health = 50

var drop = preload("res://Actors/playerUnlock.tscn")

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
	if health <0:
		die()
		return
	$DamageFlash.play("New Anim")

	pass


func die():
	set_physics_process(false)
	$HitBox.call_deferred("queue_free")
	$PhaseTimer.stop()
	for G in $Guns.get_children():
		G.shooting = false
	$JunkGenerator.play()
	$DeathAnimation.play("New Anim")



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


func _on_DeathAnimation_animation_finished(anim_name):
	var newDrop = drop.instance()
	newDrop.global_position = global_position
	newDrop.unlockName = "hunterGun"
	get_tree().current_scene.call_deferred("add_child",newDrop)
	$JunkGenerator.stop()
	emit_signal("boss_death")
	queue_free()
	pass # Replace with function body.

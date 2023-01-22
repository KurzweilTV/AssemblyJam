extends RigidBody2D

signal boss_death

var phase = 0

export var health = 50

# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.


func _physics_process(delta):
	rotation = lerp(rotation,0,delta)
	if phase == 1:
		$Guns.look_at(GlobalPlayer.controller.global_position + Vector2(0,-100))
		
	if phase == 2:
		$BasicGun.look_at(GlobalPlayer.controller.global_position + Vector2(0,-100))
func start_boss():
	$Timer.start()
	
func get_damaged(dmg):
	if phase == 0:
		return
	health -= dmg
	$DamageFlash.play("New Anim")
	if health <0:
		die()
	pass


func die():
	queue_free()

func _on_Timer_timeout():
	phase += 1
	if phase > 2:
		phase = 0
	match phase:
		0:
			$BasicGun.shooting = false
			$Shield.visible = true
			pass
		1:
			$Shield.visible = false
			$JawGag/Animator.play("Open")
			apply_central_impulse(Vector2(20 * (randf()-0.5),-3600) )
			$Guns.look_at(GlobalPlayer.controller.global_position + Vector2(0,-100))
			for G in $Guns.get_children():
				G.fire()
		2:
			$JawGag/Animator.play("Close")
			$BasicGun.fire()
			for G in $Guns.get_children():
				G.shooting = false
			
	pass # Replace with function body.


func _on_HeadBoss_body_entered(body):
	if phase == 1:
		apply_central_impulse(Vector2(20 * (randf()-0.5),-3600) )
	pass # Replace with function body.

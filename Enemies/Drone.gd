extends Enemy

var speedMax = 11000

export var bouncyBoy = true

var thaGun

func _ready():
	$Floatyness.call_deferred("advance",randf()*2.0)
	if bouncyBoy:
		$HunterGun.queue_free()
		thaGun = $BouncyGun
	else:
		$BouncyGun.queue_free()
		thaGun = $HunterGun
	set_physics_process(false)

func _physics_process(delta):
	thaGun.look_at(GlobalPlayer.controller.global_position + Vector2(0,-200))
	applied_force += global_position.direction_to(GlobalPlayer.controller.global_position + Vector2(0,-420) ) * delta * 20000
	applied_force.y -= applied_force.y * delta
	applied_force += Vector2(randf()-0.5,randf()-0.5) * 600
	applied_force = applied_force.limit_length(speedMax)
	angular_velocity -= rotation * delta * 70


func die():
	spawn_junk()
	thaGun.visible = false
	applied_force = Vector2(0,0)
	dead = true
	thaGun.shooting = false
	$Animator.play("Death")
	set_physics_process(false)
	$HitBox/CollisionShape2D.set_deferred("disabled",true) 
	$CollisionShape2D.set_deferred("disabled",true)

func _on_Animator_animation_finished(anim_name):
	if anim_name == "Death":
		queue_free()

func _on_DetectionRange_body_entered(body): # player came close
	assert(body.is_in_group("Player"))
	if !dead:
		set_physics_process(true)
		thaGun.look_at(GlobalPlayer.controller.global_position + Vector2(0,-200))
		thaGun.fire()


func _on_AttackRange_body_exited(body):
	assert(body.is_in_group("Player"))
	set_physics_process(false)
	thaGun.shooting = false
	pass # Replace with function body.

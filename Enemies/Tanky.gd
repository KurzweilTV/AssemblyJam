extends Enemy

var moveSpeed = 340

var shooting = false

export var fireBoy = true

var thaGun

# Called when the node enters the scene tree for the first time.
func _ready():
	if fireBoy:
		$Sprite/Guns/BasicGun.queue_free()
		thaGun = $Sprite/Guns/FlameThrower
	else:
		$Sprite/Guns/FlameThrower.queue_free()
		thaGun = $Sprite/Guns/BasicGun

	pass # Replace with function body.

func turn_around():
	applied_force.x *= -1
	$Sprite.scale.x *= -1
	$DetectionRange.scale.x *= -1
	pass

func resume():
	shooting = false
	applied_force.x = moveSpeed * $Sprite.scale.x
	pass

func _on_Tanky_body_entered(body):
	turn_around()
	pass # Replace with function body.

func die():
	spawn_junk()
	$HitBox.call_deferred("queue_free")
	thaGun.shooting = false
	$DetectionRange.monitorable = false
	$DetectionRange.monitoring = false
	applied_force.x = 0
	set_physics_process(false)
	$DeatHanimation.play("New Anim")
	pass

func _on_GroundTimer_timeout():
	$Sprite/GroundScanner.update()
	if !$Sprite/GroundScanner.is_colliding():
		turn_around()
		yield(get_tree().create_timer(0.7),"timeout")

func _process(delta):
	if shooting:
		$Sprite/Guns.look_at(GlobalPlayer.controller.global_position + Vector2(0,-100))

func _on_DetectionRange_body_entered(body):
	assert(body.is_in_group("Player"))
	if !shooting:
		shooting = true
		applied_force.x = 0
		thaGun.fire()
	pass # Replace with function body.


func _on_DetectionRange_body_exited(body):
	resume()
	thaGun.get_parent().global_rotation = 0
	thaGun.shooting = false
	shooting = false
	pass # Replace with function body.


func _on_DeatHanimation_animation_finished(anim_name):
	queue_free()
	pass # Replace with function body.

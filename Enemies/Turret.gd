extends Enemy

var bulletScene = preload("res://Enemies/Bullet.tscn")

var turnDir = 1

var shooting = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if shooting:
		$Tracker.look_at(GlobalPlayer.controller.global_position + Vector2(0,-160))
		$GunHolder.rotation = lerp_angle($GunHolder.rotation,$Tracker.rotation,delta)
		return
	$GunHolder.rotate(delta * 2 * turnDir)
	if $GunHolder.rotation > PI-0.1:
		turnDir = -1
	if $GunHolder.rotation < 0.1:
		turnDir = 1
	pass

func die():
	shooting = false
	$HitBox/CollisionShape2D.set_deferred("disabled",true)
	$AttackRange/CollisionShape2D.set_deferred("disabled",true)
	$GunHolder/PlayerScanner/CollisionShape2D.set_deferred("disabled",true)
	$Boom.play()
	spawn_junk()
	$DeathAnimation.play("New Anim")



func _on_PlayerScanner_body_entered(body):
	assert(body.is_in_group("Player"))
	if !shooting:
		shooting = true
		$GunHolder/HunterGun.fire()
	pass # Replace with function body.


func _on_AttackRange_body_exited(body):
	assert(body.is_in_group("Player"))
	shooting = false
	$GunHolder/HunterGun.shooting = false
	pass # Replace with function body.


func _on_DeathAnimation_animation_finished(anim_name):
	queue_free()
	pass # Replace with function body.

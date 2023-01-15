extends Enemy

var speedMax = 5000

var grenadeScene = preload("res://Enemies/Grenade.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)
	pass # Replace with function body.


func _process(delta):
	applied_force += global_position.direction_to(GlobalPlayer.controller.global_position + Vector2(0,-220) ) * delta * 4000
	applied_force.y -= applied_force.y * delta
	applied_force = applied_force.limit_length(speedMax)



func die():
	dead = true
	$Animator.play("Death")
	$HitBox/CollisionShape2D.set_deferred("disabled",true) 

func _on_Animator_animation_finished(anim_name):
	if anim_name == "Death":
		queue_free()
	pass # Replace with function body.


func _on_DetectionRange_body_entered(body):
	# player came close
	assert(body.is_in_group("Player"))
	set_process(true)
	$AttackTimer.start()
	pass # Replace with function body.


func _on_GroundScanner_body_entered(body):
	while $GroundScanner.overlaps_body(body):
		apply_central_impulse(Vector2(rand_range(-200,200), -1490 * (randf()+1.2 ) ))
		yield(get_tree().create_timer(0.3),"timeout")
	pass # Replace with function body.


func _on_AttackTimer_timeout():
	if $DetectionRange.get_overlapping_bodies().size()>0:
		var newAttack = grenadeScene.instance()
		newAttack.global_position = global_position
		newAttack.apply_central_impulse(lerp(Vector2.UP,global_position.direction_to(Vector2(0,-100)+GlobalPlayer.controller.global_position),0.5) * 500)
		get_parent().add_child(newAttack)
	pass # Replace with function body.

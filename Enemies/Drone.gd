extends Enemy

var speedMax = 11000

var grenadeScene = preload("res://Enemies/Grenade.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Floatyness.call_deferred("advance",randf()*2.0)
	set_process(false)
	pass # Replace with function body.


func _process(delta):
	applied_force += global_position.direction_to(GlobalPlayer.controller.global_position + Vector2(0,-220) ) * delta * 20000
	applied_force.y -= applied_force.y * delta
	applied_force += Vector2(randf()-0.5,randf()-0.5) * 600
	applied_force = applied_force.limit_length(speedMax)



func die():
	dead = true
	$Animator.play("Death")
	set_process(false)
	$AttackTimer.stop()
	$HitBox/CollisionShape2D.set_deferred("disabled",true) 
	$CollisionShape2D.disabled = true

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




func _on_AttackTimer_timeout():
	if $DetectionRange.get_overlapping_bodies().size()>0:
		var newAttack = grenadeScene.instance()
		var targetLoc = Vector2(0,-50) + GlobalPlayer.controller.global_position as Vector2 # where the player at
		newAttack.global_position = global_position
		newAttack.apply_central_impulse(lerp(Vector2.UP,global_position.direction_to(targetLoc),0.7) * min(900,targetLoc.distance_squared_to(global_position)) )
		get_parent().add_child(newAttack)
	pass # Replace with function body.

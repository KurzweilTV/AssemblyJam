extends RigidBody2D

var power = 200

var target = null

func _ready():
	pass

	

func _physics_process(delta):
	power += delta * 690
	linear_velocity += Vector2.RIGHT.rotated(global_rotation) * delta * power
	if target != null:
		$Tracker.look_at(target.global_position)
		rotation = lerp_angle(global_rotation,$Tracker.global_rotation,delta*3)

		pass
	pass


func _on_ArmTimer_timeout():
	var targets = $ScanRange.get_overlapping_bodies()
	if targets.size() == 0:
		return
	target = targets[0]
	if targets.size() > 1:
		for T in targets:
			if global_position.distance_to(T.global_position) < global_position.distance_to(target.global_position):
				target = T
	$ArmTimer.queue_free()
	pass # Replace with function body.


func _on_HunterMissile_body_entered(body):
	queue_free()
	pass # Replace with function body.

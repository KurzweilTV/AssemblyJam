extends RigidBody2D

var power = 200

var target = null

func _ready():
	if get_collision_layer_bit(2):
		$ScanRange.set_collision_mask_bit(3,true)
	if get_collision_layer_bit(4):
		$ScanRange.set_collision_mask_bit(1,true)
	pass

	

func _physics_process(delta):
	power += delta * 2290
	linear_velocity += Vector2.RIGHT.rotated(global_rotation) * delta * power
	if target.is_instance_valid():
		if target != null:
			$Tracker.look_at(target.global_position + Vector2(0,-80))
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

extends RigidBody2D

var power

var bounceCount = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	apply_central_impulse(Vector2(1,0).rotated(rotation) * power)
	pass # Replace with function body.



func _on_BouncyBall_body_entered(body):
	bounceCount += 1
	if bounceCount > 3 :
		queue_free()
	pass # Replace with function body.

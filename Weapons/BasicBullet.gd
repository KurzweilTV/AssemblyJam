extends RigidBody2D


var power


# Called when the node enters the scene tree for the first time.
func _ready():
	apply_central_impulse(Vector2(1,0).rotated(rotation) * power)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_DeathTimer_timeout():
	queue_free()
	pass # Replace with function body.


func _on_BasicBullet_body_entered(body):
	queue_free()
	pass # Replace with function body.

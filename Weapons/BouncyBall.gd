extends RigidBody2D

var power

# Called when the node enters the scene tree for the first time.
func _ready():
	apply_central_impulse(Vector2(1,0).rotated(rotation) * power)
	pass # Replace with function body.


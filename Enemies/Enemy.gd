extends RigidBody2D

class_name Enemy



export var health = 2.0



func get_damaged(value):
	health -= value
	if health < 0:
		die()
	pass


func die():
	# play death animation
	# possibly yield
	# self.queue_free()
	pass

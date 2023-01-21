extends RigidBody2D

class_name Enemy

var dead = false

func _ready():
	add_to_group("Enemy")

export var health = 2.0

func _process(delta):
	if modulate.g < 1:
		modulate.g += delta
		modulate.b += delta

func get_damaged(value):
	health -= value
	modulate.g = 0
	modulate.b = 0
	
	if health < 0:
		die()
	pass


func die():
	print("you should not see this message as the 'die' fucntion should be overwrtitten on all enemies" )
	# play death animation
	pass

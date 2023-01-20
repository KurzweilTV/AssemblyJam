extends Node2D

var damage

export var bulletSpeed = 200

export var projectile : Resource # the bullet that will be shot

var playerAttack = false

func shoot():
	var newPew = projectile.instance() as RigidBody2D
	newPew.set_meta("damage",damage)
	newPew.global_position = global_position
	newPew.global_rotation = global_rotation
	newPew.power = bulletSpeed
	newPew.set_collision_layer_bit(2,playerAttack) # makes it an Enemy attack
	newPew.set_collision_layer_bit(4,!playerAttack) # makes it a Player attack
	get_tree().current_scene.add_child(newPew)
	pass

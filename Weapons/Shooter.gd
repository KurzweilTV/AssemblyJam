extends Node2D

var damage

export var projectile : Resource # the bullet that will be shot

func shoot():
	var newPew = projectile.instance() as RigidBody2D
	newPew.set_meta("damage",damage)
	newPew.global_position = global_position
	newPew.global_rotation = global_rotation
	pass

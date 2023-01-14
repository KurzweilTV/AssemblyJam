class_name MoveState
extends State

# takes care of movement realted calculations

var velocity: = Vector2.ZERO
var maxSpeed = 300



func apply_movement(acceleration : Vector2):
	var player = get_parent() as KinematicBody2D
	player.move_and_slide(velocity * acceleration)
	pass

func enter(msg: Dictionary = {}):
	pass

func exit() :
	pass

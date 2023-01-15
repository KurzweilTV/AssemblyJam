extends KinematicBody2D

class_name Player


func _ready():
	GlobalPlayer.set_controller(self)
	pass


extends KinematicBody2D

class_name Player


func _ready():
	GlobalPlayer.controller = self
	pass


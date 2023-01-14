class_name State, "res://StateMachine/state.svg"

extends Node

var stateMachine = null

func _ready():
	yield(owner,"ready")

func enter(_msg = {}):
	
	pass


func exit():
	
	pass


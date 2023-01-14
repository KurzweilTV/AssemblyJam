class_name State, "res://StateMachine/state.svg"

extends Node

var stateMachine = null

func _ready():
	yield(owner,"ready")

func enter(msg = {}):
	
	pass


func exit():
	
	pass


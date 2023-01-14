extends State

""" SPAWN """

onready var player = owner as Player

func enter(msg: Dictionary = {}):
	# if is on ground -> tansition to idle
	if player.is_on_floor():
		stateMachine.transition_to("Idle")
	else:
		stateMachine.transition_to("Move/Fall")
	# else transition to falling
	pass

func exit() :
	pass

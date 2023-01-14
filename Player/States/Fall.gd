extends State

""" FALL """

# this state is active when player is not on ground and not jumping

onready var mover = get_parent() as MoveState

var gravity = 90




func _physics_process(delta):

	# apply gravity by gravity * min(airTime/maxAirTime,1)
	
	pass



func enter(msg: Dictionary = {}):

	pass

func exit() :

	pass

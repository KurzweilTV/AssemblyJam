extends State

""" IDLE """

# move should default to this state once velocity drops to 0 and player is on ground

onready var mover = get_parent() as MoveState



func _physics_process(delta):
	
	# if player pressed move key and is on ground -> switch to run
	# if player presses jump -> switch to air
	pass

func enter(msg: Dictionary = {}):
	pass

func exit() :
	pass

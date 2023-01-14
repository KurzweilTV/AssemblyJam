extends State

""" RUN """

# this state is active when player is on ground and velocity is != 0

var acceleration = 600

onready var mover = get_parent() as MoveState


func _physics_process(delta):
	# if jump pressed -> transition to air with
	
	pass

func enter(msg: Dictionary = {}):
	pass

func exit() :
	pass

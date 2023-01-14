extends State

""" JUMP """

# activated when player jumps

# requirements: needs to check if jump button is pressed upon eneter
# if jump button is realised early jump acceleartion needs to also end early

onready var mover = get_parent() as MoveState

export var jumpForce = 200 #initla force of jump
var acceleration = 0

var airTime = 0 # how long has the player been jumping for
export var maxAirTime = 1.6 # max time for gravity to kick in


func _physics_process(delta):
	airTime += delta
	
	
	
	pass



func enter(msg: Dictionary = {}):
	
	pass

func exit() :
	airTime = 0
	acceleration = 0
	pass


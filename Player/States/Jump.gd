extends State

""" JUMP """

# activated when player jumps

# requirements: needs to track the state of jump button to end jump early if released
# needs to take in to consideration inital velocity of player

onready var mover = get_parent() as MoveState
var jumpVector = Vector2.ZERO
var airSpeed = 200
export var jumpForce = 320 #initla force of jump

var airTime = 0 # how long has the player been jumping for
export var maxAirTime = 0.3 # max time for gravity to kick in


func _physics_process(delta):
	airTime += delta
	var moveDir = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	jumpVector.x = moveDir * airSpeed 
	mover.apply_movement(delta,jumpVector)
	# once player realses jump button or airTime > maxAirTime
	# switch to falling
	if !Input.is_action_pressed("ui_up") or airTime > maxAirTime:
		stateMachine.transition_to("Move/Fall")
	pass



func enter(msg: Dictionary = {}):
	jumpVector.x = mover.velocity.x
	jumpVector.y = -jumpForce
	pass

func exit() :
	airTime = 0

	pass


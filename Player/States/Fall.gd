extends State

""" FALL """

# this state is active when player is not on ground and not jumping

onready var mover = get_parent() as MoveState

var airSpeed = 190

var fallVector = Vector2.ZERO

var airTime = 0

func _physics_process(delta):
	airTime += delta *0.5
	var moveDir = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	fallVector.x = moveDir * airSpeed 
	mover.apply_movement(delta,fallVector)
	$"../../../LegTree".set("parameters/airState/blend_amount",min(airTime,1))
	if stateMachine.player.is_on_floor():
		stateMachine.transition_to("Move/Idle")
	# keep checking if on ground
	
	pass



func enter(msg: Dictionary = {}):
	fallVector.x = mover.velocity.x
	$"../../../LegTree".set("parameters/onGround/current",0)
	pass

func exit() :
	var airTime = 0
	pass

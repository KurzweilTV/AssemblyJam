extends State

""" FALL """

# this state is active when player is not on ground and not jumping

onready var mover = get_parent() as MoveState

var airSpeed = 150

var fallVector = Vector2.ZERO


func _physics_process(delta):
	var moveDir = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	fallVector.x = moveDir * airSpeed 
	mover.apply_movement(delta,fallVector)
	
	if mover.player.is_on_floor():
		stateMachine.transition_to("Move/Idle")
	# keep checking if on ground
	
	pass



func enter(msg: Dictionary = {}):
	fallVector.x = mover.velocity.x
	pass

func exit() :

	pass

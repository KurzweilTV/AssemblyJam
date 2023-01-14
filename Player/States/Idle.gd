extends State

""" IDLE """

# move should default to this state once velocity drops to 0 and player is on ground

onready var mover = get_parent() as MoveState



func _physics_process(delta):
	# if player pressed move key and is on ground -> switch to run
	if !mover.player.is_on_floor():
		stateMachine.transition_to("Move/Fall")
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		stateMachine.transition_to("Move/Run")
	# if player presses jump -> switch to air\
	if Input.is_action_just_pressed("ui_up"):
		stateMachine.transition_to("Move/Jump")
	pass

func enter(msg: Dictionary = {}):
	pass

func exit() :
	pass

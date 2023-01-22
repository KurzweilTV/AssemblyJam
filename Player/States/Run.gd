extends State

""" RUN """

# this state is active when player is on ground and velocity is != 0
var targetVelocity = Vector2.ZERO
var speed = 200
var idleSpeed = 1
var coyoteTime = 0

onready var mover = get_parent() as MoveState


func _physics_process(delta):
	if !stateMachine.player.is_on_floor():
		coyoteTime += delta
		if coyoteTime > 0.2:
			stateMachine.transition_to("Move/Fall")
	else:
		coyoteTime = 0
	# if jump pressed -> transition to jump
	if Input.is_action_just_pressed("jump"):
		stateMachine.transition_to("Move/Jump")
	# if velocity < idleSpeed -> transiion to idle
	if mover.velocity.length() < idleSpeed :
		stateMachine.transition_to("Move/Idle")
	var moveDir = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	targetVelocity = Vector2(moveDir,0) * speed

	mover.apply_movement(delta, targetVelocity)
	pass

func enter(msg: Dictionary = {}):
	$"../../../LegTree".set("parameters/onGround/current",1)
	pass

func exit() :
	coyoteTime = 0
	pass

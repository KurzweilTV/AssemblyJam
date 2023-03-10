extends State
class_name MoveState

# takes care of movement realted calculations

var velocity: = Vector2.ZERO
var gravity = 90
var maxSpeedX = 800
var maxSpeedY = 1200




func apply_movement(delta, target = Vector2.ZERO):
	if !stateMachine.player.is_on_floor():
		velocity.y += gravity
	velocity += target
	if abs(target.x) < 1 :
		velocity.x = lerp(velocity.x,0, delta * 12)
	velocity.x = min(abs(velocity.x),maxSpeedX) * sign(velocity.x)
	velocity.y = min(abs(velocity.y),maxSpeedY) * sign(velocity.y)
	velocity = stateMachine.player.move_and_slide(velocity,Vector2(0, -1))
	$"../../LegTree".set("parameters/groundState/blend_amount",abs(velocity.x/maxSpeedX) )
	$"../../Label2".text = str(velocity.x) + " " + str(velocity.y)
	pass

func enter(msg: Dictionary = {}):
	pass

func exit() :
	pass

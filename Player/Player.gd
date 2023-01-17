extends KinematicBody2D

class_name Player

var dead = false

var flipLock = false # prevents player from flipping when moving

export var armRotationOffset = -2.0

onready var oldMousePos = get_local_mouse_position()
var newMousePos = Vector2()

onready var gunArmNode = $IKPlayer/hip/torso/arm_r

var gunArmSpeed = 2.5

export var attackReady = true

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	GlobalPlayer.set_controller(self)
	pass
	
func _process(delta):
	
	if !flipLock and !Input.is_action_pressed("shoot"):
		var direction = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
		if direction !=0:
			$HurtBox.scale.x = direction
			$IKPlayer.scale.x = direction

	if oldMousePos.y < newMousePos.y:
		gunArmNode.rotation += delta * gunArmSpeed
	if oldMousePos.y > newMousePos.y:
		gunArmNode.rotation -= delta * gunArmSpeed
	gunArmNode.rotation = clamp(gunArmNode.rotation,-2.4,-1.7)
	oldMousePos = newMousePos
		
func die():
	set_process(false)
	dead = true
	$DeathAnimation.play("New Anim")
	$StateMachine.transition_to("Die")
	pass

func _input(event):
	if dead:
		return
	if event is InputEventMouseMotion:
		newMousePos = get_local_mouse_position()
	if event.is_action_pressed("ui_accept") and attackReady:
		attackReady = false
		if $IKPlayer/hip/ArmAnimator.current_animation == "SwingDown":
			$IKPlayer/hip/ArmAnimator.stop()
			$IKPlayer/hip/ArmAnimator.play("SwingUp")
		else:
			$IKPlayer/hip/ArmAnimator.play("SwingDown")
		$HurtBox.swing()
		


func _on_DeathAnimation_animation_finished(anim_name):
	get_tree().current_scene.add_child(load("res://UI/GameOver.tscn").instance())
	pass # Replace with function body.



func _on_ArmAnimator_animation_finished(anim_name):
	$IKPlayer/hip/ArmAnimator.play("Return")
	pass # Replace with function body.

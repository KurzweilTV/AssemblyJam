extends KinematicBody2D

class_name Player

var dead = false

var flipLock = false # prevents player from flipping when moving

export var armRotationOffset = -2.0

export var gunOffset = 250

onready var gunArmNode = $IKPlayer/hip/torso/arm_r

export var attackReady = true

func _ready():
#	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

	GlobalPlayer.set_controller(self)
	pass
	
func _process(delta):
	
	if !flipLock:
		var direction = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
		if direction !=0:
			$IKPlayer.scale.x = direction * 0.5 # this 0.5 is here as a testament to why one should not mess with the scale of things in the last 36 hours
	gunArmNode.look_at(get_global_mouse_position())
	gunArmNode.rotation_degrees += gunOffset


func die():
	set_process(false)
	dead = true
	$HitBox.set_collision_mask_bit(4,false)
	$DeathAnimation.play("New Anim")
	$StateMachine.transition_to("Die")
	pass

func damage_flash():
	$DamageAnimation.play("New Anim")
	pass



func _input(event):
	if dead:
		return


func _on_DeathAnimation_animation_finished(anim_name):
	get_tree().current_scene.add_child(load("res://UI/GameOver.tscn").instance())
	pass # Replace with function body.


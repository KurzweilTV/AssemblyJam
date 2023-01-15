extends KinematicBody2D

class_name Player

var dead = false

var flipLock = false # prevents player from flipping when moving

func _ready():
	GlobalPlayer.set_controller(self)
	pass
	
func _process(delta):
	print(scale)
	if !flipLock:
		var direction = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
		if direction !=0:
			$HurtBox.scale.x = direction
			$IKPlayer.scale.x = direction
		
func die():
	set_process(false)
	dead = true
	$DeathAnimation.play("New Anim")
	$StateMachine.transition_to("Die")
	pass
		

func _input(event):
	if dead:
		return
	if event.is_action_pressed("ui_accept"):
		$HurtBox.swing()


func _on_DeathAnimation_animation_finished(anim_name):
	get_tree().current_scene.add_child(load("res://UI/GameOver.tscn").instance())
	pass # Replace with function body.

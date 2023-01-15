extends KinematicBody2D

class_name Player

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
		

	 
	pass
		

func _input(event):
	if event.is_action_pressed("ui_accept"):
		$HurtBox.swing()

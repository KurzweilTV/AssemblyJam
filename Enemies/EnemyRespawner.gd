extends Node2D

var cloneReference


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func ress_me():
	$Timer.start()
	pass

func _on_Timer_timeout():
	
	get_tree().current_scene.add_child(cloneReference.duplicate())
	pass # Replace with function body.

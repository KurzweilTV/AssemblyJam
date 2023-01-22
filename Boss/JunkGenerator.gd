extends Node2D

var junkScene = preload("res://Enemies/Junk.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func play():
	$Timer.start()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func stop():
	$Timer.stop()

func _on_Timer_timeout():
	var newJunk = junkScene.instance()
	newJunk.global_position = global_position
	newJunk.call_deferred("apply_central_impulse",2000*Vector2(randf()-0.5,randf()-0.5))
	get_tree().current_scene.call_deferred("add_child",newJunk)
	pass # Replace with function body.

extends RigidBody2D

var explosionScene = preload("res://Enemies/Explosion.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ExplodeTimer_timeout():
	var boom = explosionScene.instance()
	boom.set_meta("damage",1.0)
	boom.global_position = global_position
	get_parent().add_child(boom)
	queue_free()
	pass # Replace with function body.

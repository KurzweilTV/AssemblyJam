extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_DebugDroneSpawn_body_entered(body):
	for z in $SpawnPoints.get_children():
		var newDrone = load("res://Enemies/Drone.tscn").instance()
		newDrone.global_position = z.global_position
		get_tree().current_scene.add_child(newDrone)
	queue_free()
	
	pass # Replace with function body.

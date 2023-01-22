extends Node2D


var playerScene = preload("res://Player/Player.tscn")

export var testUnlock = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if GlobalPlayer.currentSpawnID == null:
		var newPlayer = playerScene.instance()
		newPlayer.global_position = global_position
		get_tree().current_scene.call_deferred("add_child",newPlayer)
	visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

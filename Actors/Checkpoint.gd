extends Node2D

export var ID = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	assert(ID != 0)
	GlobalPlayer.register_spawn(ID,self)
	pass # Replace with function body.



func open():
	$AnimationPlayer.play("Open")
	$Line2D.modulate = ColorN("Green")

func activate(state):
	if state:
		$Line2D.modulate = ColorN("Green")
		GlobalPlayer.set_spawn(ID)
	else:
		$Line2D.modulate = ColorN("Red")
	pass


func _on_Area2D_body_entered(body):
	if GlobalPlayer.currentSpawnID != ID:
		activate(true)
	pass # Replace with function body.

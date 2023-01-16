extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func activate(state):
	if state:
		$Line2D.modulate = ColorN("Green")
		GlobalPlayer.set_spawn(self)
	else:
		$Line2D.modulate = ColorN("Red")
	pass


func _on_Area2D_body_entered(body):
	if GlobalPlayer.currentSpawn != self:
		activate(true)
	pass # Replace with function body.

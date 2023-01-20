extends Area2D

export var ID = 0


func _ready():
	assert(ID != 0)


func _on_ActionArea_body_entered(body):
	GameManager.trigger_action(ID)
	
	pass # Replace with function body.

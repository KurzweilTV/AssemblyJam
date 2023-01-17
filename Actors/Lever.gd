extends Trigger


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func turn_on():
	emit_signal("activate")
	$AnimationPlayer.play("New Anim")
	$CollisionShape2D.call_deferred("queue_free")
	pass

func _on_Lever_body_entered(body):
	turn_on()
	pass # Replace with function body.


func _on_Lever_area_entered(area):
	turn_on()
	pass # Replace with function body.

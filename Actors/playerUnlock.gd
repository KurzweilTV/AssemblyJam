extends RigidBody2D

export var unlockName : String

signal unlock(name)



# Called when the node enters the scene tree for the first time.
func _ready():
	connect("unlock",GameManager,"unlock_skill")

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass





func _on_Area2D_body_entered(body):
	assert(body.is_in_group("Player"))
	emit_signal("unlock",unlockName)
	$Icon.visible = false
	$Area2D/CollisionShape2D.call_deferred("queue_free")
	pass # Replace with function body.

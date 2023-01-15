extends Area2D

var invincibile = false


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func get_damaged(value : int):
	GlobalPlayer.damage(value)
	invincibile = true
	$Invincibility.play("New Anim")
	pass

func _on_HitBox_body_entered(body):
	assert(body.has_meta("damage"))
	if invincibile:
		return
	get_damaged(body.get_meta("damage"))
	body.queue_free() # eat the bullet, 

func _on_HitBox_area_entered(area):
	assert(area.has_meta("damage"))
	if invincibile:
		return
	get_damaged(area.get_meta("damage"))

func _on_Invincibility_animation_finished(anim_name):
	invincibile = false

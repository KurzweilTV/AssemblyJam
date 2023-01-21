extends Area2D

var invincibile = false

var shieldActive = false

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func get_damaged(value : float):
	GlobalPlayer.damage(value)
	invincibile = true
	get_parent().damage_flash()
	# here should be a call to someting that animates damage
	yield(get_tree().create_timer(0.5),"timeout")
	invincibile = false
	pass

func activate_shield():
	visible = true
	shieldActive = true
	$ShieldTimer.start()
	pass

func _input(event):
	if event.is_action_pressed("shield"):
		if GlobalPlayer.use_energy(35) :
			activate_shield()

func _on_HitBox_body_entered(body):
	assert(body.has_meta("damage"))
	body.queue_free() # eat the bullet, 
	if invincibile or shieldActive:
		return
	get_damaged(body.get_meta("damage"))

func _on_HitBox_area_entered(area):
	assert(area.has_meta("damage"))
	if invincibile or shieldActive:
		return
	get_damaged(area.get_meta("damage"))



func _on_ShieldTimer_timeout():
	visible = false
	shieldActive = false
	pass # Replace with function body.
